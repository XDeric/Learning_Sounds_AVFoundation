//
//  NextVC.swift
//  SoundsorMusic
//
//  Created by EricM on 3/16/20.
//  Copyright © 2020 EricM. All rights reserved.
//

import UIKit

class NextVC: UIViewController {
    
    //MARK: Removes old observers
    // Best to use this in starting screen or launch screen
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
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
    
    lazy var pButton: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.setTitleColor(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("Pause", for: .normal)
        button.addTarget(self, action: #selector (secondaryPause), for: .touchUpInside)
        
        return button
    }()
    
    @objc func secondaryPause(){
        SoundManager.shared.postAudioplayer()
    }
    
    @objc func goToNextVC(){
        let vc = LeapVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupConstraints()
        SoundManager.shared.chooseSound(sound: "sephiroth")
        SoundManager.shared.audioPlayerObserver()
        //SoundManager.shared.playOnce(sound: "sephiroth")
        // Do any additional setup after loading the view.
    }
    
    func setupConstraints(){
        button.translatesAutoresizingMaskIntoConstraints = false
        pButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pButton)
        view.addSubview(button)
        NSLayoutConstraint.activate([
        
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            pButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            pButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }

}
