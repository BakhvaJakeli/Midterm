//
//  ProgressViewController.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import UIKit

class ProgressViewController: UIViewController {
    
    var currentIndex = -1
    @IBOutlet var labels: [UILabel]!
    var OGColor: UIColor!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        currentIndex += 1
        
        self.labels.forEach { label in
            label.backgroundColor = .clear
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            
            self.labels[self.currentIndex].backgroundColor = .clear
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "Questions") as! QuestionsViewController
            let transition: CATransition = CATransition()
            transition.duration = 0.4
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            self.navigationController!.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(vc, animated: false)
        })
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //        labels.forEach { label in
        //            label.backgroundColor = .clear
        //        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        OGColor = self.labels.first!.backgroundColor
        self.view.GradiantColor(colorTop: .blue, colorSecond: .purple, colorThird: .Navy, colorBottom: .darkPurple)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.flicker()
        })
        
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
