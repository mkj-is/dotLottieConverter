//
//  File.swift
//  
//
//  Created by Matěj Kašpar Jirásek on 06.04.2023.
//

import dotLottieLoader
import Foundation

extension DotLottieCreator {
    func create() async -> URL? {
        await withCheckedContinuation { continuation in
            self.create { url in
                continuation.resume(with: .success(url))
            }
        }
    }
}
