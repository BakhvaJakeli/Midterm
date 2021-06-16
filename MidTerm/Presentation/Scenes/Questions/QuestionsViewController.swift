//
//  QuestionsViewController.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import UIKit
import AVFoundation

class QuestionsViewController: UIViewController {
    
    var counter = 30
    var theTimer: Timer?
    var backgroundMusic: AVAudioPlayer?
    var correctAnswerMusic: AVAudioPlayer?
    var wrongAnswerMusic: AVAudioPlayer?
    var answerPressedMusic: AVAudioPlayer?
    var callHelpSound: AVAudioPlayer?
    
    var delegate: DelegateProtocol!
    
    var didUseFifty = false
    var didUseCall = false
    var didUseCrowd = false
    
    var question: Question!
    var myButtonOutlets = [QuestionsButton]()
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOne: QuestionsButton!
    @IBOutlet weak var answerTwo: QuestionsButton!
    @IBOutlet weak var answerThree: QuestionsButton!
    @IBOutlet weak var answerFour: QuestionsButton!
    @IBOutlet weak var fiftyimg: UIImageView!
    @IBOutlet weak var audianceImg: UIImageView!
    @IBOutlet weak var phoneImg: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    var viewGradient: CAGradientLayer?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let theQuestion = question
        if let vc = segue.destination as? DutaViewController {
            vc.daQuestion = theQuestion
        }
        if let vc = segue.destination as? AudianceViewController {
            vc.correctAnswerIndex = theQuestion?.correct
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        theTimer = timer()
        if didUseFifty {
            fiftyimg.isHidden = true
        }
        if didUseCall {
            phoneImg.isHidden = true
        }
        if didUseCrowd {
            audianceImg.isHidden = true
        }
        myButtonOutlets = [answerOne, answerTwo, answerThree, answerFour]
        myButtonOutlets.forEach({ $0.titleLabel?.numberOfLines = 0
                                    $0.titleLabel?.lineBreakMode = .byWordWrapping
                                    $0.titleLabel?.textAlignment = .center
        })
        counter = 30

        viewGradient = self.view.GradiantColor(colorTop: .darkPurple, colorSecond: .Navy, colorThird: .blue, colorBottom: .darkPurple)
        customLabel()
        audiinceHelp()
        callHelp()
        configureFifty()
//        QuestionManager.shared.fetchQuestions(completion: { thegame in
//            self.daGame = thegame
//
//            self.index = Int.random(in: 0...((thegame.games.first?.questions.count)! - 1))
            DispatchQueue.main.async {
                self.setUpQuestions()

            }
//        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.musicStart()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.theTimer?.fire()
        })
    }
    
    @IBAction func answerOneBtn(_ sender: QuestionsButton) {
        myButtonOutlets.forEach { $0.isUserInteractionEnabled = false }
        didPressAnyAnswer(sender)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            
            sender.subLayer?.removeFromSuperlayer()
            //            let _ = (sender as UIButton).BackgroundColor(colorTop: .green, colorBottom: .systemTeal)
            if self.question.correct == 0 {
                self.CorrectAnswerPressed(sender)
            }
            else {
                let _ = self.answerOne.BackgroundColor(colorTop: .red, colorBottom: .red)
                self.viewGradient?.removeFromSuperlayer()
                self.view.backgroundColor = .black
                self.backgroundMusic?.stop()
                self.answerPressedMusic?.stop()
                self.wrongAnswerMusicStart()
                UIView.animate(withDuration: 1) {
                    self.view.backgroundColor = .bakhvaRed
                }
                self.setUpAlert()

                
            }
        })
    }
//    Who Wants To Be A Millioanire Correct Answer.mp3
    @IBAction func answerTwoBtn(_ sender: QuestionsButton) {
        myButtonOutlets.forEach { $0.isUserInteractionEnabled = false }
        didPressAnyAnswer(sender)

        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            
            sender.subLayer?.removeFromSuperlayer()
            //            let _ = (sender as UIButton).BackgroundColor(colorTop: .green, colorBottom: .systemTeal)
            if self.question.correct == 1 {
                self.CorrectAnswerPressed(sender)
            }
            else {
                let _ = self.answerTwo.BackgroundColor(colorTop: .red, colorBottom: .red)
                self.viewGradient?.removeFromSuperlayer()
                self.view.backgroundColor = .black
                self.backgroundMusic?.stop()
                self.answerPressedMusic?.stop()
                self.wrongAnswerMusicStart()
                UIView.animate(withDuration: 1) {
                    self.view.backgroundColor = .bakhvaRed
                }
                self.setUpAlert()
                
            }
        })
        
    }
    
    @IBAction func answerThreeBtn(_ sender: QuestionsButton) {
        myButtonOutlets.forEach { $0.isUserInteractionEnabled = false }
        didPressAnyAnswer(sender)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            
            sender.subLayer?.removeFromSuperlayer()
            if self.question.correct == 2 {
                self.CorrectAnswerPressed(sender)
            }
            else {
                let _ = self.answerThree.BackgroundColor(colorTop: .red, colorBottom: .red)
                self.viewGradient?.removeFromSuperlayer()
                self.view.backgroundColor = .black
                self.backgroundMusic?.stop()
                self.answerPressedMusic?.stop()
                self.wrongAnswerMusicStart()
                UIView.animate(withDuration: 1) {
                    self.view.backgroundColor = .bakhvaRed
                }
                self.setUpAlert()

            }
        })
    }
    @IBAction func answerFourBtn(_ sender: QuestionsButton) {
        myButtonOutlets.forEach { $0.isUserInteractionEnabled = false }
        didPressAnyAnswer(sender)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            
            sender.subLayer?.removeFromSuperlayer()
            
            if self.question.correct == 3 {
                self.CorrectAnswerPressed(sender)
                
            }
            else {
                let _ = self.answerFour.BackgroundColor(colorTop: .red, colorBottom: .red)
                self.viewGradient?.removeFromSuperlayer()
                self.view.backgroundColor = .black
                self.backgroundMusic?.stop()
                self.answerPressedMusic?.stop()
                self.wrongAnswerMusicStart()
                UIView.animate(withDuration: 1) {
                    self.view.backgroundColor = .bakhvaRed
                }
                self.setUpAlert()
            }
        })
        
    }
    
    func CorrectAnswerPressed(_ sender: QuestionsButton) {
        let _ = (sender as UIButton).BackgroundColor(colorTop: .green, colorBottom: .systemTeal)
        self.backgroundMusic?.stop()
        self.answerPressedMusic?.stop()
        self.correctAnswerMusicStart()
        self.viewGradient?.removeFromSuperlayer()
        self.view.backgroundColor = .black
        UIView.animate(withDuration: 2) {
            let _ = self.view.GradiantColor(colorTop: .Navy, colorSecond: .green, colorThird: .green, colorBottom: .Navy)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func didPressAnyAnswer(_ sender: QuestionsButton) {
        theTimer?.invalidate()
        viewGradient?.removeFromSuperlayer()
        UIView.animate(withDuration: 0.7) {
            self.viewGradient = self.view.BackgroundColor(colorTop: .colorTop, colorBottom: .systemYellow)
        }
        answerPressedMusicStart()
        self.backgroundMusic?.stop()
    }
    
    func configureFifty() {
        fiftyimg.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressFifty))
        fiftyimg.addGestureRecognizer(tapGesture)
    }
    
    @objc func didPressFifty() {
        let rand = Int.random(in: 0...3)
        fiftyimg.isUserInteractionEnabled = false
        delegate.dismissFiftyHelp(truth: true)
        UIView.animate(withDuration: 0.8) {
            self.fiftyimg.isHidden = true
        }
        if question.correct == rand {
            didPressFifty()
        } else {
            myButtonOutlets.forEach{$0.isHidden = true}
//            myButtonOutlets.forEach{$0.subLayer?.removeFromSuperlayer()}
//            myButtonOutlets.forEach{$0.subLayer?.layoutIfNeeded()}
//            myButtonOutlets.forEach{let _ = $0.BackgroundColor(colorTop: .black, colorBottom: .purple)}
            myButtonOutlets[rand].isHidden = false
//            myButtonOutlets[rand].layoutIfNeeded()

            myButtonOutlets[self.question.correct].isHidden = false
            
        }
    }
    
}
extension QuestionsViewController {
    func customLabel() {
        questionLabel.clipsToBounds = true
        questionLabel.layer.cornerRadius = questionLabel.frame.height / 3
        questionLabel.layer.borderWidth = 3
        questionLabel.layer.borderColor = UIColor.systemBlue.cgColor
        
        timerLabel.clipsToBounds = true
        timerLabel.layer.cornerRadius = questionLabel.frame.height / 5
        timerLabel.layer.borderWidth = 3
        timerLabel.layer.borderColor = UIColor.systemBlue.cgColor
    }
}

extension QuestionsViewController {
    func audiinceHelp() {
        audianceImg.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(seagueView))
        audianceImg.addGestureRecognizer(gesture)
    }
    @objc func seagueView() {
        theTimer?.invalidate()
        delegate.dismisCrowdHelp(truth: true)
        UIView.animate(withDuration: 0.8) {
            self.audianceImg.isHidden = true
        }
        performSegue(withIdentifier: "Audiance", sender: self)
    }
}
extension QuestionsViewController {
    func callHelp() {
        phoneImg.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(daseagueView))
        phoneImg.addGestureRecognizer(gesture)
    }
    @objc func daseagueView() {
        self.backgroundMusic?.stop()
        self.phoneImg.isUserInteractionEnabled = false
        delegate.dismissCallhelp(truth: true)
        UIView.animate(withDuration: 0.8) {
            self.phoneImg.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.callHelpMusicStart()
        })
        theTimer?.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            self.callHelpSound?.stop()
            self.performSegue(withIdentifier: "Duta", sender: self)

        })
    }
}


extension QuestionsViewController {
    func setUpQuestions() {
        questionLabel.text = question.question
        answerOne.setTitle(question.content[0], for: .normal)
        answerTwo.setTitle(question.content[1], for: .normal)
        answerThree.setTitle(question.content[2], for: .normal)
        answerFour.setTitle(question.content[3], for: .normal)
        
    }
}

extension QuestionsViewController {
    func setUpAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let alert = UIAlertController(title: "You Lost", message: "Go Back to main Menu to try again", preferredStyle: .actionSheet)
            let Ok = UIAlertAction(title: "Ok", style: .default) { _ in
                self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(Ok)
            self.present(alert, animated: true, completion: nil)
        })
    }
}

extension QuestionsViewController {
    func musicStart() {
        
        let musicURL = Bundle.main.path(forResource: "Who Wants To Be A Millionaire Music 64000 500000 Question", ofType: "mp3")
        
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
    func correctAnswerMusicStart() {
        let musicURL = Bundle.main.path(forResource: "Who Wants To Be A Millioanire Correct Answer", ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let musicURL = musicURL else { return }
            correctAnswerMusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicURL))
            guard let correctAnswerMusic = correctAnswerMusic else {return}
            correctAnswerMusic.play()
        }
        catch  {
            print("error")
        }
    }
    func wrongAnswerMusicStart() {
        let musicURL = Bundle.main.path(forResource: "$8,000 Lose - Who Wants to Be a Millionaire", ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let musicURL = musicURL else { return }
            wrongAnswerMusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicURL))
            guard let wrongAnswerMusic = wrongAnswerMusic else {return}
            wrongAnswerMusic.play()
        }
        catch  {
            print("error")
        }
    }
    func answerPressedMusicStart() {
        let musicURL = Bundle.main.path(forResource: "$2,000 Final Answer - Who Wants to Be a Millionaire", ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let musicURL = musicURL else { return }
            answerPressedMusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicURL))
            guard let answerPressedMusic = answerPressedMusic else {return}
            answerPressedMusic.play()
        }
        catch  {
            print("error")
        }
    }
    func callHelpMusicStart() {
        let musicURL = Bundle.main.path(forResource: "Old Telephone Rings Ringtone Free Ringtones Downloads", ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let musicURL = musicURL else { return }
            callHelpSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicURL))
            guard let callHelpSound = callHelpSound else {return}
            callHelpSound.play()
        }
        catch  {
            print("error")
        }
    }
}

extension QuestionsViewController {
    func timer() -> Timer {
        
        var leTimer: Timer!
        leTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.counter >= 0 {
                self.timerLabel.text = ("\(self.counter) seconds")
                self.counter -= 1
            }
            else {
                Timer.invalidate()
            }
            if self.timerLabel.text == ("10 seconds") {
                UIView.animate(withDuration: 1) {
                    self.timerLabel.textColor = .red
                }
            }
            if self.counter == 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.viewGradient?.removeFromSuperlayer()
                    self.view.backgroundColor = .black
                    self.backgroundMusic?.stop()
                    self.wrongAnswerMusicStart()
                    UIView.animate(withDuration: 1) {
                        self.view.backgroundColor = .bakhvaRed
                    }
                    self.setUpAlert()
                })

            }
        }
        

        return leTimer
    }
    

}



