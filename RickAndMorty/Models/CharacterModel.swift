//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Алёночка on 18.11.2021.
//

import Foundation

struct CharacterModel: Codable {
    
    var id: Int
    var name: String
    var image: String
    var status: String
    var species: String
    var gender: String
}
