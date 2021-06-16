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
    static let bakhvaRed = UIColor(red: 102.0/255.0, green: 0.0/255.0, blue: 51.0/255.0, alpha: 1.0)
}


extension UIView {
    func BackgroundColor(colorTop: UIColor, colorBottom: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at:0)
        return gradientLayer
    }
    
    func GradiantColor(colorTop: UIColor, colorSecond: UIColor,colorThird: UIColor, colorBottom: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor,colorSecond.cgColor,colorThird.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0,0.33,0.66,1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at:0)
        return gradientLayer
    }
}

class bakhvaButton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.clipsToBounds = true
        let _ = self.GradiantColor(colorTop: .darkPurple, colorSecond: .Navy, colorThird: .purple, colorBottom: .darkPurple)
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
    var subLayer: CAGradientLayer?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.subLayer = self.BackgroundColor(colorTop: .black, colorBottom: .purple)
        self.clipsToBounds = true
        self.backgroundColor = .clear
        self.layer.cornerRadius = self.frame.height / 3
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemBlue.cgColor
//        self.titleLabel?.font = .boldSystemFont(ofSize: 11)
        self.setTitleColor(.systemGray5, for: .normal)
    }
    
    
}

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 5
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layoutIfNeeded()
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

class customTextview: UITextView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let _ = self.GradiantColor(colorTop: .black, colorSecond: .purple, colorThird: .systemIndigo, colorBottom: .black)
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

extension UIViewController {
    
    @objc func animateColorChanges() {
        let colors: [UIColor] = [.blue, .Navy, .darkPurple, .black]
        UIView.animate(withDuration: 2) {
            self.view.backgroundColor = colors[Int.random(in: 0..<colors.count)]
        } completion: { _ in
            return
        }
    }
    
    func changeBackgroundColors() {
        let timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(animateColorChanges), userInfo: nil, repeats: true)
        timer.fire()
    }
}

@IBDesignable class PaddingLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
