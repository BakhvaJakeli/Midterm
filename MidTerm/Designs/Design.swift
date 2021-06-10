//
//  Design.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import UIKit

class customButton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(.white, for: .normal)
        self.setTitle("More", for: .normal)
        self.backgroundColor = .clear
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        let diamond = UIView(frame: self.bounds)
        diamond.translatesAutoresizingMaskIntoConstraints = false
        diamond.isUserInteractionEnabled = false // button will handle touches
        // Handle it gracefully without force unwrapping
        self.insertSubview(diamond, belowSubview: self.titleLabel!)
        diamond.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 4))
        diamond.backgroundColor = .red
        diamond.layer.cornerRadius = 10
        diamond.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        diamond.widthAnchor.constraint(equalTo: diamond.heightAnchor).isActive = true
        diamond.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        diamond.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

extension UIColor {
      static let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0)
      static let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0)
    static let Navy = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 128.0/255.0, alpha: 1.0)
}


extension UIView {
    func BackgroundColor(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}
