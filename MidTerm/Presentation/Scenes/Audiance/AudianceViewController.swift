//
//  AudianceViewController.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 13.06.21.
//

import UIKit

class AudianceViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var firstAnswer: UIView!
    @IBOutlet weak var secondAnswer: UIView!
    @IBOutlet weak var thirdAnswer: UIView!
    @IBOutlet weak var fourthAnswer: UIView!
    @IBOutlet weak var firstHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var thirdHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var fourthHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var audianceOne: UILabel!
    @IBOutlet weak var audianceTwo: UILabel!
    @IBOutlet weak var audianceThree: UILabel!
    @IBOutlet weak var audianceFour: UILabel!
    var correctAnswerIndex:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.layer.cornerRadius = 20
        DispatchQueue.main.asyncAfter(deadline: .now() + 8, execute: {
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.audienceHelp()
        })
    }
    func audienceHelp() {
        let CorrectAnswerVotes =  Int.random(in: 120...400)
        var myDict = [Int: Int]()
        myDict[correctAnswerIndex] = CorrectAnswerVotes
        var totalDone = 400 - CorrectAnswerVotes
        for i in 0..<4 {
            if i != correctAnswerIndex {
                var temp = 0
                if i == 3 || (i == 2 && correctAnswerIndex == 3) {
                    temp = totalDone
                }
                else {
                    temp = Int.random(in: 0...totalDone)
                    totalDone -= temp
                }
                myDict[i] = temp
            }
        }
        
        
        self.firstHeightConstraint.constant   = CGFloat(myDict[0] ?? 0)
        self.secondHeightConstraint.constant  = CGFloat(myDict[1] ?? 0)
        self.thirdHeightConstraint.constant   = CGFloat(myDict[2] ?? 0)
        self.fourthHeightConstraint.constant  = CGFloat(myDict[3] ?? 0)
        UIView.animate(withDuration: 0.7) {
            self.view.layoutIfNeeded()
        }
        
        
        audianceOne.numberOfLines = 0
        audianceTwo.numberOfLines = 0
        audianceThree.numberOfLines = 0
        audianceFour.numberOfLines = 0
        audianceOne.text = "#1\n\(myDict[0] ?? 0)"
        audianceTwo.text = "#2\n\(myDict[1] ?? 0)"
        audianceThree.text = "#3\n\(myDict[2] ?? 0)"
        audianceFour.text = "#4\n\(myDict[3] ?? 0)"
        
    }
    
}


