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

    @Option(help: ArgumentHelp(
        "Output folder",
        discussion: "Will be created in case it does not exist. If not provided files will be saved to temp folder."
    ), transform: URL.init(fileURLWithPath:))
    private var output: URL?

    @Flag(help: "Will print paths to all created dotLottie files.")
    private var verbose: Bool = false

    func run() async throws {
        for file in files {
            let result = await DotLottieCreator(animationUrl: file).create()
            guard let result else {
                throw ConverterError.fileNotDecoded(url: file)
            }

            if let output {
                let fileManager: FileManager = .default
                let destinationURL = output.appendingPathComponent(result.lastPathComponent)

                if !fileManager.fileExists(atPath: output.path(percentEncoded: false)) {
                    try FileManager.default.createDirectory(at: output, withIntermediateDirectories: true, attributes: nil)
                }
                try FileManager.default.moveItem(at: result, to: destinationURL)
                if verbose {
                    print(destinationURL)
                }
            } else if verbose {
                print(result)
            }
        }
    }
}
