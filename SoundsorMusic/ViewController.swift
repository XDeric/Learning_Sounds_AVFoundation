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

     var audioPlayer: AVAudioPlayer?
    
    lazy var instructions: UILabel = {
        let text = UILabel()
        text.text = "Play Music"
        text.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        text.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        text.numberOfLines = 0
        text.sizeToFit()
        text.layer.cornerRadius = 5
        return text
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.setTitleColor(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("Play", for: .normal)
        button.addTarget(self, action: #selector (play), for: .touchUpInside)
        
        return button
    }()
    
    lazy var pause: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.setTitleColor(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("Pause", for: .normal)
        button.addTarget(self, action: #selector (pauseIt), for: .touchUpInside)
        
        return button
    }()
    
    @objc func play(){
       // Fetch the Sound data set.
//       if let bundle = Bundle.main.path(forResource: "ff7BattleTheme", ofType: "mp3") {
//        let backgroundMusic = URL.init(fileURLWithPath: bundle)
        let music = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ff7BattleTheme", ofType: "mp3")!)
           do {
               audioPlayer = try! AVAudioPlayer(contentsOf: music as URL)
               guard let audioPlayer = audioPlayer else { return }
               audioPlayer.prepareToPlay()
               audioPlayer.numberOfLoops = -1
               audioPlayer.play()
           } catch {
               print(error)
           }
    }
    
    @objc func pauseIt(){
        if audioPlayer!.isPlaying{
            audioPlayer?.pause()
        }
        else {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        setupConstrints()
        // Do any additional setup after loading the view.
    }
    
    func setupConstrints(){
        instructions.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        pause.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(instructions)
        view.addSubview(button)
        view.addSubview(pause)
        
        NSLayoutConstraint.activate([
        
            instructions.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instructions.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: instructions.bottomAnchor, constant: 30),
            
            pause.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pause.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30)
        ])
    }


}

