//
//  AnimatedButton.swift
//  Animations - 1
//
//  Created by Shishir_Mac on 22/3/23.
//

import UIKit

class AnimatedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customize()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        customize()
    }
    
    func customize() {
        
        self.clipsToBounds = true
        
        let buttonAnimation = CABasicAnimation(keyPath: "position.x")
        buttonAnimation.beginTime = 0.0
        buttonAnimation.duration = 1.5
        let buttonRHS: Double = Double(((self.titleLabel?.frame.maxX)! + (self.titleLabel?.frame.width)!))
        let buttonLHS: Double = Double(((self.titleLabel?.frame.minX)! - ((self.titleLabel?.frame.width)!)))
        buttonAnimation.fromValue = NSNumber(value: buttonRHS)
        buttonAnimation.toValue = NSNumber(value: buttonLHS)
        buttonAnimation.repeatCount = .infinity
        self.titleLabel!.layer.add(buttonAnimation, forKey: "basic")
    }
}
