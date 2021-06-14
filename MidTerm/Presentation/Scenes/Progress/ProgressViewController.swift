//
//  ProgressViewController.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import UIKit
import AVFoundation

class ProgressViewController: UIViewController {
    var isMilestone = false
    var time = 2
    var winMusic: AVAudioPlayer?
    var daGame: TheGame?
    var index = 0
    
    var currentIndex = -1
    @IBOutlet var labels: [UILabel]!
    var OGColor: UIColor!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        currentIndex += 1
        if currentIndex == 5 || currentIndex == 10 || currentIndex == 15 {
            isMilestone = true
            time = 6
        } else {
            isMilestone = false
            time = 2
        }
        
        if currentIndex != 0 {
            answerPressedMusicStart()
        }
        
        
        self.labels.forEach { label in
            label.backgroundColor = .clear
        }
        
        if isMilestone {
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                self.handleStuff()
            }
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.handleStuff()
            }
        }
    }
    
    func handleStuff() {
        self.index = Int.random(in: 0...((daGame?.games.first?.questions.count)! - 1))
        self.labels[self.currentIndex].backgroundColor = .clear
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Questions") as! QuestionsViewController
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController!.view.layer.add(transition, forKey: nil)
        vc.question = self.daGame?.games.first?.questions[index]
        self.daGame?.games[0].questions.remove(at: index)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        winMusic?.stop()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        OGColor = self.labels.first!.backgroundColor
        let _ = self.view.GradiantColor(colorTop: .blue, colorSecond: .purple, colorThird: .Navy, colorBottom: .darkPurple)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.flicker()
        })
        QuestionManager.shared.fetchQuestions(completion: { thegame in
            self.daGame = thegame
            
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }
}

extension ProgressViewController {
    func flicker() {
        if(labels[currentIndex].backgroundColor) == .yellow {
            UIView.animate(withDuration: 0.2, delay: 0.2) {
                self.labels[self.currentIndex].backgroundColor = .clear
            } completion: { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.flicker()
                }
            }
        } else {
            UIView.animate(withDuration: 0.2, delay: 0.2) {
                self.labels[self.currentIndex].backgroundColor = .yellow
            } completion: { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.flicker()
                }
            }
        }
        
    }
}

extension ProgressViewController {
    func answerPressedMusicStart() {
        var musicURL : String?
        if isMilestone {
            musicURL = Bundle.main.path(forResource: "Milestone Win", ofType: "mp3")
        } else {
            musicURL = Bundle.main.path(forResource: "Just win", ofType: "mp3")
        }
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let musicURL = musicURL else { return }
            winMusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicURL))
            guard let answerPressedMusic = winMusic else {return}
            answerPressedMusic.play()
        }
        catch  {
            print("error")
        }
    }
}
