//
//  UIButtonExtenstion.swift
//  Animations - 1
//
//  Created by Shishir_Mac on 22/3/23.
//

import UIKit

extension UIButton{
    func ButtonShake()  {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 3
        shake.autoreverses = true
        
        let formPoint = CGPoint(x: center.x-5, y: center.y)
        let fromValue = NSValue(cgPoint: formPoint)
        
        let toPoint = CGPoint(x: center.x+5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
    
    func ButtonFlash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    func ButtonPulse() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 0.1
        
        layer.add(pulse, forKey: nil)
    }
    
    func heartbeat() {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        animation.values = [1.0, 1.2, 1.0]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 1.0
        animation.repeatCount = 10
        
        layer.add(animation, forKey: "pulse")
    }
    
    func ButtonBounce() {
        let bounce = CABasicAnimation(keyPath: "position")
        
        bounce.duration = 0.25
        bounce.repeatCount = 2
        bounce.autoreverses = true
        
        let formPoint = CGPoint(x: center.x, y: center.y)
        let fromValue = NSValue(cgPoint: formPoint)
        
        let toPoint = CGPoint(x: center.x, y: center.y-25)
        let toValue = NSValue(cgPoint: toPoint)
        
        bounce.fromValue = fromValue
        bounce.toValue = toValue
        
        layer.add(bounce, forKey: nil)
    }
    
    func ButtonTada() {
        
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        pulseAnimation.toValue = 1.5
        pulseAnimation.duration = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = 5
        layer.add(pulseAnimation, forKey: "pulsing")
    }
    
    func ButtonRotates() {
        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
        
        fullRotation.fromValue = NSNumber(floatLiteral: 0)
        fullRotation.toValue = NSNumber(floatLiteral: Double(CGFloat.pi * 2))
        fullRotation.duration = 0.5
        fullRotation.repeatCount = 1
        
        layer.add(fullRotation, forKey: "360")
    }
}
