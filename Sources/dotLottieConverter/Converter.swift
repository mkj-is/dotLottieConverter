import dotLottieLoader
import ArgumentParser
import Foundation

private enum ConverterError: Error {
    case fileNotDecoded(file: String)
}

@main
struct Converter: AsyncParsableCommand {
    @Argument(help: "List of Lottie JSON files to be converted to .lottie")
    private var files: [String]

    @Option(help: "Output folder")
    private var output: String?

    @Flag
    private var verbose: Bool = false

    func run() async throws {
        let outputFolder = output.flatMap { URL(fileURLWithPath: $0, isDirectory: true) }
        for file in files {
            let url = URL(fileURLWithPath: file)
            let result = await DotLottieCreator(animationUrl: url).create()
            guard let result else {
                throw ConverterError.fileNotDecoded(file: file)
            }

            if let outputFolder {
                let destinationURL = outputFolder.appendingPathComponent(result.lastPathComponent)
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
