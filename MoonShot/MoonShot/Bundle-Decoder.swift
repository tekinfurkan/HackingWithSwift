//
//  Bundle-Decoder.swift
//  MoonShot
//
//  Created by Furkan on 20.10.2023.
//

import Foundation

extension Bundle {
    func Decoder<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate the file")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to convert data")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode")
        }
        
        return loaded
    }
}
