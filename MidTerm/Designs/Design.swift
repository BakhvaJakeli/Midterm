//
//  Design.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import UIKit

extension UIColor {
    static let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    static let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0)
    static let Navy = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 128.0/255.0, alpha: 1.0)
    static let darkPurple = UIColor(red: 25.0/255.0, green: 0.0/255.0, blue: 51.0/255.0, alpha: 1.0)
}


extension UIView {
    func BackgroundColor(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func GradiantColor(colorTop: UIColor, colorSecond: UIColor,colorThird: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor,colorSecond.cgColor,colorThird.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0,0.33,0.66,1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}

class bakhvaButton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.clipsToBounds = true
        self.GradiantColor(colorTop: .darkPurple, colorSecond: .Navy, colorThird: .purple, colorBottom: .darkPurple)
        self.backgroundColor = .clear
        self.layer.cornerRadius = self.frame.height / 3
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.purple.cgColor
        self.autoresizingMask = [.flexibleBottomMargin, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin]
        
//        let view = UIView()
//        view.layer.cornerRadius = self.frame.height / 3
//        view.GradiantColor(colorTop: .darkPurple, colorSecond: .Navy, colorThird: .purple, colorBottom: .darkPurple)
        
//        let width = self.frame.width
//        let height = self.frame.height
//        let midY = (height) / 2
//
//        let aPath = UIBezierPath()
//
//        aPath.move(to: CGPoint(x: 20, y: 0))
//
//        aPath.addLine(to: CGPoint(x: width - 20, y: 0))
//        aPath.addLine(to: CGPoint(x: width, y: midY))
//        aPath.addLine(to: CGPoint(x: width - 20, y: height))
//        aPath.addLine(to: CGPoint(x: 20, y: height))
//        aPath.addLine(to: CGPoint(x: 0, y: midY))
//        aPath.addLine(to: CGPoint(x: 20, y: 0))
//
//        let layer = CAShapeLayer()
//        layer.strokeColor = UIColor.darkGray.cgColor
//        layer.lineWidth = 5
//        layer.cornerRadius = self.frame.height / 3
//
//        self.layer.addSublayer(layer)
//
//
//        let gradient = CAGradientLayer()
//        gradient.frame = self.frame
//        gradient.cornerRadius = self.frame.height / 3
//        gradient.colors = [UIColor.purple.withAlphaComponent(0.5).cgColor, UIColor.black.cgColor]
//
//        let shapeMask = CAShapeLayer()
//       shapeMask.path = aPath.cgPath
//        gradient.mask = shapeMask
//        self.layer.addSublayer(gradient)
        self.titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.setTitleColor(.lightGray, for: .normal)
    }
    
}

class QuestionsButton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.clipsToBounds = true
        self.BackgroundColor(colorTop: .black, colorBottom: .purple)
        self.backgroundColor = .clear
        self.layer.cornerRadius = self.frame.height / 3
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.titleLabel?.font = .boldSystemFont(ofSize: 11)
        self.setTitleColor(.lightGray, for: .normal)
    }
}

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

class customTextview: UITextView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.GradiantColor(colorTop: .black, colorSecond: .purple, colorThird: .systemIndigo, colorBottom: .black)
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.font = .boldSystemFont(ofSize: 24)
        self.textColor = .lightGray
    }
}

class customLabelOne: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.clipsToBounds = true
        self.backgroundColor = .clear
        self.layer.cornerRadius = self.frame.height / 3
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.font = .boldSystemFont(ofSize: 18)
        self.textColor = .lightGray
    }
}

class customLabelTwo: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.clipsToBounds = true
        self.backgroundColor = .clear
        self.layer.cornerRadius = self.frame.height / 3
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.font = .boldSystemFont(ofSize: 24)
        self.textColor = .yellow
        
    }
}
