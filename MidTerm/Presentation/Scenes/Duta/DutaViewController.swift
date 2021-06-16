//
//  DutaViewController.swift
//  MidTerm
//
//  Created by Bakhva Jakeli on 14.06.21.
//

import UIKit
import AVFoundation

class DutaViewController: UIViewController {
    
    var daQuestion: Question!
    var answer1Music: AVAudioPlayer?
    
    @IBOutlet weak var answerLabel: UILabel!
    override func viewDidLoad() {
//        answer1MusicStart()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
//            self.answerLabel.text = "..I think it's \(self.daQuestion.correct + 1)"
//        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 9, execute: {
            self.dismiss(animated: true, completion: nil)
        })
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        answer1MusicStart()
    }
}

extension DutaViewController {
    func answer1MusicStart() {
 
        var musicURL = Bundle.main.path(forResource: "Ar Mcalia", ofType: "mp3")
        
        if Int.random(in: 1...100) > 15 {
            switch daQuestion.correct {
            case 0:
                musicURL = Bundle.main.path(forResource: "answer1", ofType: "mp3")

            case 1:
                musicURL = Bundle.main.path(forResource: "answer2", ofType: "mp3")

            case 2:
                musicURL = Bundle.main.path(forResource: "answer3", ofType: "mp3")

            case 3:
                musicURL = Bundle.main.path(forResource: "answer4", ofType: "mp3")

            default:
                break
            }
        }
        

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let musicURL = musicURL else { return }
            answer1Music = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicURL))
            guard let answer1Music = answer1Music else {return}
            answer1Music.play()
        }
        catch  {
            print("error")
        }
    }

}
