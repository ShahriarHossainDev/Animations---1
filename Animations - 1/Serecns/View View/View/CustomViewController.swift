//
//  CustomViewController.swift
//  Animations - 1
//
//  Created by Shishir_Mac on 25/3/23.
//

import UIKit

class CustomViewController: UIViewController {
    
    let newViewWidth: CGFloat = 100
    
    
    @IBOutlet weak var getColorView: GradientView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var zoomOnlyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.dropShadow()
        getRandomColor()
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
    
    func getRandomColor() {
        /*
         let red   = CGFloat((arc4random() % 256)) / 255.0
         let green = CGFloat((arc4random() % 256)) / 255.0
         let blue  = CGFloat((arc4random() % 256)) / 255.0
         let alpha = CGFloat(1.0)
         
         UIView.animate(withDuration: 3.0, delay: 0.0, options:[.repeat, .autoreverse], animations: {
         self.getColorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
         }, completion:nil)
         */
        
        getColorView.startAnimating(colors: [#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1).cgColor,#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1).cgColor], location: [0.0, 0.5, 1.0] )
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
