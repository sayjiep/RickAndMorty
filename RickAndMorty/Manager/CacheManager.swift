//
//  CacheManager.swift
//  RickAndMorty
//
//  Created by Алёночка on 21.11.2021.
//

import Foundation

class CacheManager {
    static let fileManager = FileManager.default
    static let fileURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("data.plist")
    
    static func saveCharacters(_ characters: [CharacterModel]) {
        if let data = try? PropertyListEncoder().encode(characters) {
            if fileManager.fileExists(atPath: fileURL.path) == false {
                fileManager.createFile(atPath: fileURL.path, contents: data, attributes: nil)
            }
            else {
                try? data.write(to: fileURL)
            }
        }
    }
    
    static func characters() -> [CharacterModel]? {
        guard let data = try? Data(contentsOf: fileURL),
              let characters = try? PropertyListDecoder().decode([CharacterModel].self, from: data) else {
            return nil
        }
        return characters
    }
}
