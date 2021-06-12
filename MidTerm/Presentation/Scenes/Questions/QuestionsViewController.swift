//
//  QuestionsViewController.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOne: QuestionsButton!
    @IBOutlet weak var answerTwo: QuestionsButton!
    @IBOutlet weak var answerThree: QuestionsButton!
    @IBOutlet weak var answerFour: QuestionsButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.GradiantColor(colorTop: .darkPurple, colorSecond: .Navy, colorThird: .blue, colorBottom: .darkPurple)
        customLabel()
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
