//
//  DutaViewController.swift
//  MidTerm
//
//  Created by David Berdznishvili on 14.06.21.
//

import UIKit

class DutaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.dismiss(animated: true, completion: nil)
        })

    }

}
