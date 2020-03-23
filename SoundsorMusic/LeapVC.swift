//
//  LeapVC.swift
//  SoundsorMusic
//
//  Created by EricM on 3/16/20.
//  Copyright © 2020 EricM. All rights reserved.
//

import UIKit

class LeapVC: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.setTitleColor(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("Next1", for: .normal)
        button.addTarget(self, action: #selector (goToNextVC), for: .touchUpInside)
        
        return button
    }()
    
    lazy var pauseB: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.setTitleColor(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("pause", for: .normal)
        button.addTarget(self, action: #selector (SoundManager.shared.pause), for: .touchUpInside)
        
        return button
    }()
    
    @objc func goToNextVC(){
        let vc = anotherVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupConstraints()
        SoundManager.shared.chooseSound(sound: "ff7")

        // Do any additional setup after loading the view.
    }
    
    func setupConstraints(){
        button.translatesAutoresizingMaskIntoConstraints = false
        pauseB.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        view.addSubview(pauseB)
        NSLayoutConstraint.activate([
        
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            pauseB.topAnchor.constraint(equalTo: button.bottomAnchor),
            pauseB.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pauseB.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            pauseB.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
            
        ])
    }

}
