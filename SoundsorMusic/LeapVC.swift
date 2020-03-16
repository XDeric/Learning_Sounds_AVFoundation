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
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector (goToNextVC), for: .touchUpInside)
        
        return button
    }()
    
    @objc func goToNextVC(){
        let vc = anotherVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        SoundManager.shared.chooseSound(sound: "ff7")

        // Do any additional setup after loading the view.
    }
    
    func setupConstraints(){
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
        
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }

}
