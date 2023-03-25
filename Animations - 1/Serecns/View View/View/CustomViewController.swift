//
//  CustomViewController.swift
//  Animations - 1
//
//  Created by Shishir_Mac on 25/3/23.
//

import UIKit

class CustomViewController: UIViewController {
    
    let newViewWidth: CGFloat = 100
    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var zoomOnlyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.dropShadow()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Function
    
    func zoomOnlyViewAnimation() {
        
        UIView.animate(withDuration: 2.0) {
            self.zoomOnlyView.frame = CGRect(x: 0, y: 0, width: self.newViewWidth, height: self.newViewWidth)
            self.zoomOnlyView.center = self.view.center
        }
    }
    
    func viewCurveing() {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 1,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
            self.zoomOnlyView.frame = CGRect(x: 0, y: 0, width: self.newViewWidth, height: self.newViewWidth)
            self.zoomOnlyView.center = self.view.center
        }, completion: nil)
    }
    
    func movingView() {
        UIView.animateKeyframes(withDuration: 5,
                                delay: 0,
                                options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 0.25) {
                self.zoomOnlyView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY)
            }
        })
        
        
    }
    
    // MARK: - IBAction
    @IBAction func clearButtonAction(_ sender: UIButton) {
        zoomOnlyView.isHidden = true
        zoomOnlyView.frame.size = CGSize(width: 0, height: 0)
        zoomOnlyView.center = self.view.center
    }
    
    @IBAction func curveButtonAction(_ sender: UIButton) {
        zoomOnlyView.isHidden = false
        viewCurveing()
    }
    
    @IBAction func zoomOnlyButtonAction(_ sender: UIButton) {
        zoomOnlyView.isHidden = false
        zoomOnlyViewAnimation()
    }
    
    @IBAction func movingButtonAction(_ sender: UIButton) {
        zoomOnlyView.isHidden = false
        movingView()
    }
    
    
}
