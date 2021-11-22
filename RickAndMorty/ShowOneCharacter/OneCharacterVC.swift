//
//  OneCharacterVC.swift
//  RickAndMorty
//
//  Created by Алёночка on 19.11.2021.
//

import UIKit
import SDWebImage

class OneCharacterVC: UIViewController {
    
    private let networkManager = NetworkManager()
    var character: CharacterModel?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        avatarImage.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        avatarImage.sd_setImage(with: URL(string: character?.image ?? ""), completed: nil)
        nameLabel.text = character?.name
        statusLabel.text = character?.status
        speciesLabel.text = character?.species
        genderLabel.text = character?.gender
        
    }
}
extension DefaultStringInterpolation {
  mutating func appendInterpolation<T>(optional: T?) {
    appendInterpolation(String(describing: optional))
  }
}

