//
//  GradientView.swift
//  Animations - 1
//
//  Created by Shishir_Mac on 25/3/23.
//

import UIKit

class GradientView: UIView{
    @discardableResult
    func addGradientLayer(colors: [CGColor], location: [NSNumber]?) -> CAGradientLayer {
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [colors[0], colors[1], colors[0]]
        
        gradientLayer.locations = location
        self.layer.addSublayer(gradientLayer)
        
        return gradientLayer
    }
    
    func addAnimation() -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 0.9
        return animation
    }
    
    func startAnimating(colors: [CGColor], location: [NSNumber]){
        
        let gradientLayer = addGradientLayer(colors: colors, location: location)
        print("fff\(colors)")
        let animation = addAnimation()
        gradientLayer.add(animation, forKey: animation.keyPath)
        
        
    }
}
