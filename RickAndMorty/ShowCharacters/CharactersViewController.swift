//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Алёночка on 17.11.2021.
//

import UIKit

class CharactersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let networkManager = NetworkManager()
    private var characters: [CharacterModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        networkManager.getCharacters(handler: { [weak self] characters in
            DispatchQueue.main.async {
                self?.characters = characters
                self?.tableView.reloadData()
            }
        })
    }
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return characters.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as! CharacterCell
        
        cell.nameCharacter.text = characters[indexPath.row].name
        
        networkManager.getImage(by: characters[indexPath.row].image) { (image) in
            cell.avatarImage.image = image
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "OneCharacterVC") as! OneCharacterVC
        vc.character = characters[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

