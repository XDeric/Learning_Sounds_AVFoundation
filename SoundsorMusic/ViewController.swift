//
//  ViewController.swift
//  SoundsorMusic
//
//  Created by EricM on 3/10/20.
//  Copyright © 2020 EricM. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    lazy var instructions: UILabel = {
        let text = UILabel()
        text.text = "play music"
        text.numberOfLines = 3
        text.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        text.alpha = 0
        return text
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("Play", for: .normal)
//        button.addTarget(self, action: #selector (nextVC), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        setupConstrints()
        // Do any additional setup after loading the view.
    }
    
    func setupConstrints(){
        instructions.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(instructions)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
        
            instructions.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instructions.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.topAnchor.constraint(equalTo: instructions.bottomAnchor)
        ])
    }


}

