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
        self.backgroundColor = UIColor.white
        let width = self.frame.width
        let height = self.frame.height
        let midY = (height) / 2

        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x: 20, y: 0))

        aPath.addLine(to: CGPoint(x: width - 20, y: 0))
        aPath.addLine(to: CGPoint(x: width, y: midY))
        aPath.addLine(to: CGPoint(x: width - 20, y: height))
        aPath.addLine(to: CGPoint(x: 20, y: height))
        aPath.addLine(to: CGPoint(x: 0, y: midY))
        aPath.addLine(to: CGPoint(x: 20, y: 0))

        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.darkGray.cgColor
        layer.lineWidth = 5
        layer.path = aPath.cgPath

        self.layer.addSublayer(layer)
        
        
        let gradient = CAGradientLayer()
        gradient.frame = aPath.bounds
        gradient.colors = [UIColor.purple.withAlphaComponent(0.5).cgColor, UIColor.black.cgColor]
        
        let shapeMask = CAShapeLayer()
        shapeMask.path = aPath.cgPath
        gradient.mask = shapeMask
        self.layer.addSublayer(gradient)

        self.titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.setTitleColor(.systemPurple, for: .normal)
    }
    
}
