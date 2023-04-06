import dotLottieLoader
import ArgumentParser
import Foundation

private enum ConverterError: Error {
    case fileNotDecoded(url: URL)
}

@main
struct Converter: AsyncParsableCommand {
    static let configuration: CommandConfiguration = CommandConfiguration(
        abstract: "dotLottie converter is a command-line tool that converts Lottie JSON files to dotLottie files using the dotLottieLoader library.",
        usage: "dotLottieConverter <lottie files – lottiefiles/*.json> --output <output folder>] [--verbose]"
    )

    @Argument(
        help: "List of Lottie JSON files to be converted to dotLottie.",
        transform: URL.init(fileURLWithPath:)
    )
    private var files: [URL]

    @Option(name: .shortAndLong, help: ArgumentHelp(
        "Output folder",
        discussion: "Will be created in case it does not exist. If not provided files will be saved to temp folder."
    ), transform: URL.init(fileURLWithPath:))
    private var output: URL?

    @Option(name: .shortAndLong, help: "Theme color.")
    private var color: String = "#ffffff"

    @Flag(name: .shortAndLong, help: "Creates file with looping disabled.")
    private var noLoop: Bool = false

    @Flag(name: .shortAndLong, help: "Will print paths to all created dotLottie files.")
    private var verbose: Bool = false

    func run() async throws {
        for file in files {

            var creator = DotLottieCreator(animationUrl: file)
            creator.loop = !noLoop
            creator.themeColor = color
            if let output {
                creator.directory = output
            }

            let result = await creator.create()

            guard let result else {
                throw ConverterError.fileNotDecoded(url: file)
            }

            if verbose {
                print(result)
            }
        }
    }
}
