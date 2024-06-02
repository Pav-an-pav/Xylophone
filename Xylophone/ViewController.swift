//
//  ViewController.swift
//  Xylophone
//
//  Created by Anna Pavlova on 27.05.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var keys: [UIButton]!
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keys.forEach { key in
            key.layer.cornerRadius = 30
            key.clipsToBounds = true
        }
        
    }

    @IBAction func keyCPressed(_ sender: UIButton) {
        var char = sender.currentTitle!
        playSound(char)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            sender.alpha = 1
        }
    }
    
    func playSound(_ soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    
}

