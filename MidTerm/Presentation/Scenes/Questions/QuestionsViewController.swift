//
//  QuestionsViewController.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import UIKit

class QuestionsViewController: UIViewController {

    var daGame: TheGame!
    var index: Int!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOne: QuestionsButton!
    @IBOutlet weak var answerTwo: QuestionsButton!
    @IBOutlet weak var answerThree: QuestionsButton!
    @IBOutlet weak var answerFour: QuestionsButton!
    @IBOutlet weak var fiftyimg: UIImageView!
    @IBOutlet weak var audianceImg: UIImageView!
    @IBOutlet weak var phoneImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.GradiantColor(colorTop: .darkPurple, colorSecond: .Navy, colorThird: .blue, colorBottom: .darkPurple)
        customLabel()
        audiinceHelp()
        QuestionManager.shared.fetchQuestions(completion: { thegame in
            self.daGame = thegame
            
            self.index = Int.random(in: 0...((thegame.games.first?.questions.count)! - 1))
            DispatchQueue.main.async {
                self.setUpQuestions()

            }

        })

    }
    
    @IBAction func answerOneBtn(_ sender: QuestionsButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            if self.daGame!.games.first!.questions[self.index].correct == 0 {
                self.answerOne.BackgroundColor(colorTop: .green, colorBottom: .green)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.navigationController?.popViewController(animated: true)
                })

            }
            else {
                self.answerOne.BackgroundColor(colorTop: .red, colorBottom: .red)
            }
        })
    }
    
    @IBAction func answerTwoBtn(_ sender: QuestionsButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            if self.daGame!.games.first!.questions[self.index].correct == 1 {
                self.answerTwo.BackgroundColor(colorTop: .green, colorBottom: .green)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.navigationController?.popViewController(animated: true)
                })

            }
            else {
                self.answerTwo.BackgroundColor(colorTop: .red, colorBottom: .red)
            }
        })
        
    }
    
    @IBAction func answerThreeBtn(_ sender: QuestionsButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            if self.daGame!.games.first!.questions[self.index].correct == 2 {
                self.answerThree.BackgroundColor(colorTop: .green, colorBottom: .green)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.navigationController?.popViewController(animated: true)
                })

            }
            else {
                self.answerThree.BackgroundColor(colorTop: .red, colorBottom: .red)

            }
        })
    }
    @IBAction func answerFourBtn(_ sender: QuestionsButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            if self.daGame!.games.first!.questions[self.index].correct == 3 {
                self.answerFour.BackgroundColor(colorTop: .green, colorBottom: .green)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.navigationController?.popViewController(animated: true)
                })

            }
            else {
                self.answerFour.BackgroundColor(colorTop: .red, colorBottom: .red)
            }
        })

    }
    
}
extension QuestionsViewController {
    func customLabel() {
        questionLabel.clipsToBounds = true
        questionLabel.layer.cornerRadius = questionLabel.frame.height / 3
        questionLabel.layer.borderWidth = 3
        questionLabel.layer.borderColor = UIColor.systemBlue.cgColor
    }
}

extension QuestionsViewController {
    func audiinceHelp() {
        audianceImg.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(seagueView))
        audianceImg.addGestureRecognizer(gesture)
    }
    @objc func seagueView() {
        performSegue(withIdentifier: "Audiance", sender: self)
    }
}

extension QuestionsViewController {
    func setUpQuestions() {
        questionLabel.text = daGame.games.first?.questions[index].question
        answerOne.setTitle(daGame.games.first?.questions[index].content[0], for: .normal)
        answerTwo.setTitle(daGame.games.first?.questions[index].content[1], for: .normal)
        answerThree.setTitle(daGame.games.first?.questions[index].content[2], for: .normal)
        answerFour.setTitle(daGame.games.first?.questions[index].content[3], for: .normal)

    }
}
