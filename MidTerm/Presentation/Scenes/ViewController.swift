//
//  ViewController.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {

    var backgroundMusic: AVAudioPlayer?


    override func viewDidLoad() {
        super.viewDidLoad()
        musicStart()
    }


}

extension ViewController {
    func musicStart() {
        if let backgroundMusic = backgroundMusic, backgroundMusic.isPlaying {
            backgroundMusic.stop()
        }
        else {
            let musicURL = Bundle.main.path(forResource: "Who Wants To Be A Millionaire Full Theme", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                guard let musicURL = musicURL else { return }
                backgroundMusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicURL))
                guard let backgroundMusic = backgroundMusic else {return}
                backgroundMusic.play()
            }
            catch  {
                print("error")
            }
        }
    }
}
