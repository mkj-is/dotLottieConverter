import dotLottieLoader
import Foundation

public struct Converter {

    func convert() async {
        let url = URL(string: "")!
        let result = await DotLottieCreator(animationUrl: url).create()
    }
}
