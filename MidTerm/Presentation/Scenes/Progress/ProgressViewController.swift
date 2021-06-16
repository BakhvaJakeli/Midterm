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
    var millionDollarMusic: AVAudioPlayer?
    var daGame: TheGame?
    var index = 0
        
    var usedFifty = false
    var usedCall = false
    var usedCrows = false
    
    
    var currentIndex = -1
    @IBOutlet var labels: [UILabel]!
    var OGColor: UIColor!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpProgress()
    }
    func victoryRoyale() {
        millionDollarMusicStart()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            let alert = UIAlertController(title: "Congrutalations", message: "You just won Million Dollars!!! click Ok to play again", preferredStyle: .actionSheet)
            let Ok = UIAlertAction(title: "Ok", style: .default) { _ in
                self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(Ok)
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    
    func handleStuff() {
        if currentIndex == 15 {
            return
        }
        else {
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
            vc.didUseFifty = self.usedFifty
            vc.didUseCrowd = self.usedCrows
            vc.didUseCall = self.usedCall
            vc.delegate = self
            self.daGame?.games[0].questions.remove(at: index)
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        winMusic?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        delegate?.dismissHelp(truth: true)
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
        if currentIndex < 15 {
            if(labels[currentIndex].backgroundColor) == .yellow {
                UIView.animate(withDuration: 0.2, delay: 0.2) {
                    if self.isMilestone {
                        self.labels[self.currentIndex - 1].backgroundColor = .green
                    }
                    else {
                        self.labels[self.currentIndex].backgroundColor = .clear
                    }
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
    
    func millionDollarMusicStart() {
        let musicURL = Bundle.main.path(forResource: "$1 Millon Win Music - You Just Won A Million Dollars!!!", ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let musicURL = musicURL else { return }
            millionDollarMusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicURL))
            guard let millionDollarMusic = millionDollarMusic else {return}
            millionDollarMusic.play()
        }
        catch  {
            print("error")
        }
    }
}

extension ProgressViewController {
    func setUpProgress() {
        currentIndex += 1
        if currentIndex == 15 {
            victoryRoyale()
            return
        }
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
}

protocol DelegateProtocol {
    func dismissFiftyHelp(truth:Bool)
    func dismissCallhelp(truth:Bool)
    func dismisCrowdHelp(truth:Bool)
}



extension ProgressViewController: DelegateProtocol {
    func dismissCallhelp(truth: Bool) {
        self.usedCall = truth
    }
    
    func dismisCrowdHelp(truth: Bool) {
        self.usedCrows = truth
    }
    
    func dismissFiftyHelp(truth: Bool) {
        self.usedFifty = truth
    }
    
    
}
