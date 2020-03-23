//
//  PassData.swift
//  SoundsorMusic
//
//  Created by EricM on 3/20/20.
//  Copyright © 2020 EricM. All rights reserved.
//

import UIKit
import UserNotifications

class PassData: UIViewController {
    let notification = Notification(name: .didUpdateAudioPlayer)
    
    lazy var text: UILabel = {
        let text = UILabel()
        text.text = "Audioplayer status"
        text.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        text.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        text.numberOfLines = 0
        text.sizeToFit()
        text.layer.cornerRadius = 5
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(handleDidCreatehoppingList(notification:)), name: .didCreateShoppingList, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleDidAudiplayerChange), name: .didUpdateAudioPlayer, object: nil)
    }
    
    @objc func handleDidAudiplayerChange(notification: Notification){
        if let status = notification.object as? [String] {
            text.text = "Off"
           }
    }
    
}

extension Notification.Name {
    static let didUpdateAudioPlayer = Notification.Name("didUpdateAudioPlayer")
}
