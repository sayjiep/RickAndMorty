//
//  AnimationVC.swift
//  RickAndMorty
//
//  Created by Алёночка on 18.11.2021.
//

import UIKit
import Lottie

class AnimationVC: UIViewController {
    
    var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimation()
        
    }
    
    private func setupAnimation() {
        animationView = .init(name: "mortyAnimation")
        animationView?.frame = view.bounds
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 0.8
        view.addSubview(animationView!)
        animationView?.play()
        view.sendSubviewToBack(animationView!)
    }
}
