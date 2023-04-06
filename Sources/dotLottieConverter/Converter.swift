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

    func run() async throws {
        for file in files {
            let url = URL(filePath: file)
            let result = await DotLottieCreator(animationUrl: url).create()
            if let result {
                print(result)
            } else {
                throw ConverterError.fileNotDecoded(file: file)
            }
        }
    }
}
