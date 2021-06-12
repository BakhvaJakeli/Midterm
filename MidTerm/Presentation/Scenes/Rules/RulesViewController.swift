//
//  RulesViewController.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 12.06.21.
//

import UIKit

class RulesViewController: UIViewController {

    @IBOutlet weak var RulesText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.GradiantColor(colorTop: .black, colorSecond: .Navy, colorThird: .systemBlue, colorBottom: .black)

    }

    @IBAction func doneBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
