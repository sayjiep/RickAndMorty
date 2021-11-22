//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Алёночка on 17.11.2021.
//

import Foundation
import UIKit

class NetworkManager {
    
    
    private let urlString = "https://rickandmortyapi.com/api/character"
    private let imageCache = NSCache<AnyObject, AnyObject>()
    
    func getCharacters(handler: @escaping (([CharacterModel]) -> Void)) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if data != nil && error == nil {
                let apiResponse = try? JSONDecoder().decode(APIResponse.self, from: data!)
                if apiResponse != nil {
                    let characters = apiResponse!.results
                    CacheManager.saveCharacters(characters)
                    handler(characters)
                }
            }
            else if let characters = CacheManager.characters() {
                handler(characters)
            }
            else {
                handler([])
            }
        }.resume()
    }
    
    func getCharacter(handler: @escaping (([CharacterModel]) -> Void)) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if data != nil && error == nil {
                let apiResponse = try? JSONDecoder().decode(APIResponse.self, from: data!)
                if apiResponse != nil {
                    let character = apiResponse!.results
                    handler(character)
                }
            }
        }.resume()
    }
    
    func getImage(by urlStr: String, handler: @escaping ((UIImage) -> Void)) {
        guard let url = URL(string: urlStr) else { return }
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            handler(imageFromCache)
        }
        
        if let data = try? Data(contentsOf: url) {
            let image = UIImage(data: data)
            imageCache.setObject(image!, forKey: url as AnyObject)
            handler(image!)
        }
    }
}
