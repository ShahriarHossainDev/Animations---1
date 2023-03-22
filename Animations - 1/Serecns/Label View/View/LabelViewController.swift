//
//  LabelViewController.swift
//  Animations - 1
//
//  Created by Shishir_Mac on 22/3/23.
//

import UIKit

class LabelViewController: UIViewController {
    
    let img = UIImageView(image: UIImage(systemName: "doc.fill"))
    
    @IBOutlet weak var loadingLabel: DWAnimatedLabel!
    @IBOutlet weak var fading: DWAnimatedLabel!
    @IBOutlet weak var fadingButton: UIButton!
    @IBOutlet weak var comingLabel: DWAnimatedLabel!
    @IBOutlet weak var typingLabel: DWAnimatedLabel!
    
    @IBOutlet weak var animatedButton: UIButton!
    @IBOutlet weak var animatedButtonWithImage: UIButton!
    @IBOutlet weak var animatedButtonImageStop: UIButton!
    
    @IBOutlet weak var roundedAnimatedButton: UIButton!
    @IBOutlet weak var roundedAnimatedImageButton: UIButton!
    
    @IBOutlet weak var animatedButtonSubclass: AnimatedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadingLabelAction()
        
        animatedButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        animatedButtonWithImage.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        animatedButtonImageStop.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        roundedAnimatedButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        roundedAnimatedImageButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        animatedButtonSubclass.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animatedButton.clipsToBounds = true
        
        let buttonAnimation = CABasicAnimation(keyPath: "position.x")
        buttonAnimation.beginTime = 0.0
        buttonAnimation.duration = 1.5
        
        let buttonRHS: Double = Double(((animatedButton.titleLabel?.frame.maxX)! + (animatedButton.titleLabel?.frame.width)!))
        let buttonLHS: Double = Double(((animatedButton.titleLabel?.frame.minX)! - ((animatedButton.titleLabel?.frame.width)!)))
        buttonAnimation.fromValue = NSNumber(value: buttonRHS)
        buttonAnimation.toValue = NSNumber(value: buttonLHS )
        buttonAnimation.repeatCount = .infinity
        
        self.animatedButton.titleLabel!.layer.add(buttonAnimation, forKey: "basic")
        
        animateButtonWithImage()
        
        roundedAnimatedButton.layer.masksToBounds = false
        roundedAnimatedButton.layer.cornerRadius = roundedAnimatedButton.frame.width/2
        roundedAnimatedButton.titleLabel?.textAlignment = .center
        
        animateRoundedButton()
        
        animateRoundedButtonStop()
        
        roundedAnimatedImageButton.layer.cornerRadius = roundedAnimatedButton.frame.width/2
        roundedAnimatedImageButton.titleLabel?.textAlignment = .center
        
        img.translatesAutoresizingMaskIntoConstraints = false
        
        self.roundedAnimatedImageButton.addSubview(img)
        
        NSLayoutConstraint.activate([
            img.centerXAnchor.constraint(equalTo: roundedAnimatedImageButton.centerXAnchor),
            img.centerYAnchor.constraint(equalTo: roundedAnimatedImageButton.centerYAnchor),
            img.widthAnchor.constraint(equalToConstant: 20),
            img.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        animateRoundedButtonImage()
    }
    
    // MARK: - function
    func loadingLabelAction () {
        loadingLabel.text = "LOADING"
        loadingLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        loadingLabel.animationType = .wave
        loadingLabel.placeHolderColor = .gray
        loadingLabel.backgroundColor = .black
        loadingLabel.textColor = . white
        
        loadingLabel.startAnimation(duration: 20.0, nil)
    }
    
    func animateRoundedButtonImage() {
        
        roundedAnimatedImageButton.clipsToBounds = true
        
        let buttonMid: Double = Double(((roundedAnimatedImageButton.titleLabel?.frame.midX)!))
        let buttonLHS: Double = Double(((roundedAnimatedImageButton.titleLabel?.frame.minX)! - ((roundedAnimatedImageButton.titleLabel?.frame.width)!)))
        
        let labelFromRHSAnimation = CABasicAnimation(keyPath: "position.x")
        
        let buttonRHS: Double = Double(((roundedAnimatedImageButton.titleLabel?.frame.maxX)! + (roundedAnimatedImageButton.titleLabel?.frame.width)!)) + 15.0
        
        labelFromRHSAnimation.fromValue = NSNumber(value: buttonRHS)
        labelFromRHSAnimation.toValue = NSNumber(value: buttonMid)
        labelFromRHSAnimation.beginTime = 5.0
        labelFromRHSAnimation.duration = 2
        
        let labelFromMidAnimation = CABasicAnimation(keyPath: "position.x")
        labelFromMidAnimation.fromValue = NSNumber(value: buttonMid)
        labelFromMidAnimation.toValue = NSNumber(value: buttonLHS)
        labelFromMidAnimation.beginTime = 1.0
        labelFromMidAnimation.duration = 2
        
        let labelStayOffAnimation = CABasicAnimation(keyPath: "hidden")
        labelStayOffAnimation.fromValue = false
        labelStayOffAnimation.toValue = true
        labelStayOffAnimation.beginTime = 3.0
        labelStayOffAnimation.duration = 0.01
        labelStayOffAnimation.fillMode = .forwards
        
        let labelAppearBackAnimation = CABasicAnimation(keyPath: "hidden")
        labelAppearBackAnimation.fromValue = true
        labelAppearBackAnimation.toValue = false
        labelAppearBackAnimation.beginTime = 5.0
        labelAppearBackAnimation.duration = 0.01
        labelAppearBackAnimation.fillMode = .forwards
        
        let labelGroupAnimations = CAAnimationGroup()
        labelGroupAnimations.animations = [labelFromRHSAnimation, labelFromMidAnimation, labelStayOffAnimation, labelAppearBackAnimation]
        labelGroupAnimations.duration = 8
        labelGroupAnimations.repeatCount = .infinity
        labelGroupAnimations.beginTime = CACurrentMediaTime()
        
        let imageMid: Double = Double(((roundedAnimatedImageButton.titleLabel?.frame.midX)!))
        let imageLHS: Double = Double(((roundedAnimatedImageButton.titleLabel?.frame.minX)! - ((roundedAnimatedImageButton.titleLabel?.frame.width)!)))
        
        let imageHideAnimation = CABasicAnimation(keyPath: "hidden")
        imageHideAnimation.fromValue = 1
        imageHideAnimation.toValue = 0
        imageHideAnimation.beginTime = 0
        imageHideAnimation.duration = 8.0
        
        let imageFromMidAnimation = CABasicAnimation(keyPath: "position.x")
        imageFromMidAnimation.fromValue = NSNumber(value: imageMid)
        imageFromMidAnimation.toValue = NSNumber(value: imageLHS)
        imageFromMidAnimation.beginTime = 6.0
        imageFromMidAnimation.duration = 2
        
        let imageFromRHSAnimation = CABasicAnimation(keyPath: "position.x")
        let imageRHS: Double = buttonRHS
        imageFromRHSAnimation.fromValue = NSNumber(value: imageRHS)
        imageFromRHSAnimation.toValue = NSNumber(value: imageMid)
        imageFromRHSAnimation.beginTime = 3.0
        imageFromRHSAnimation.duration = 2
        
        let imageGroupAnimations = CAAnimationGroup()
        imageGroupAnimations.animations = [imageHideAnimation, imageFromRHSAnimation, imageFromMidAnimation]
        imageGroupAnimations.duration = 8.0
        imageGroupAnimations.repeatCount = .infinity
        imageGroupAnimations.beginTime = 0.0
        
        self.roundedAnimatedImageButton.titleLabel!.layer.add(labelGroupAnimations, forKey: "basicRep")
        
        img.layer.add(imageGroupAnimations, forKey: "imageRep")
    }
    
    func animateRoundedButtonStop() {
        roundedAnimatedButton.clipsToBounds = true
        
        let labelAnimationInitial = CABasicAnimation(keyPath: "position.x")
        labelAnimationInitial.beginTime = CACurrentMediaTime() + 2.0
        labelAnimationInitial.duration = 1.5
        let buttonMid: Double = Double(((roundedAnimatedButton.titleLabel?.frame.midX)!))
        let buttonLHS: Double = Double(((roundedAnimatedButton.titleLabel?.frame.minX)! - ((roundedAnimatedButton.titleLabel?.frame.width)!)))
        labelAnimationInitial.fromValue = NSNumber(value: buttonMid)
        labelAnimationInitial.toValue = NSNumber(value: buttonLHS )
        
        let labelFromRHSAnimation = CABasicAnimation(keyPath: "position.x")
        let buttonRHS: Double = Double(((roundedAnimatedButton.titleLabel?.frame.maxX)! + (roundedAnimatedButton.titleLabel?.frame.width)!)) + 15.0
        labelFromRHSAnimation.fromValue = NSNumber(value: buttonRHS)
        labelFromRHSAnimation.toValue = NSNumber(value: buttonMid)
        labelFromRHSAnimation.beginTime = 3.0
        labelFromRHSAnimation.duration = 2
        
        // move from mid to lhs
        let labelFromMidAnimation = CABasicAnimation(keyPath: "position.x")
        labelFromMidAnimation.fromValue = NSNumber(value: buttonMid)
        labelFromMidAnimation.toValue = NSNumber(value: buttonLHS)
        labelFromMidAnimation.beginTime = 1.0
        labelFromMidAnimation.duration = 2
        
        let labelGroupAnimations = CAAnimationGroup()
        labelGroupAnimations.animations = [labelFromRHSAnimation, labelFromMidAnimation]
        // animations is a group of CABasicAnimation
        labelGroupAnimations.duration = 6 // will stay in the middle for 6 - 2 -2 seconds
        labelGroupAnimations.repeatCount = .infinity
        self.roundedAnimatedButton.titleLabel!.layer.add(labelGroupAnimations, forKey: "basicRep")
    }
    
    func animateRoundedButton() {
        animatedButtonImageStop.clipsToBounds = true
        
        let labelAnimationInitial = CABasicAnimation(keyPath: "position.x")
        labelAnimationInitial.beginTime = CACurrentMediaTime() + 2.0
        labelAnimationInitial.duration = 1.5
        
        let buttonMid: Double = Double(((animatedButtonImageStop.titleLabel?.frame.midX)!))
        let buttonLHS: Double = Double(((animatedButtonImageStop.titleLabel?.frame.minX)! - ((animatedButtonImageStop.titleLabel?.frame.width)!)))
        labelAnimationInitial.fromValue = NSNumber(value: buttonMid)
        labelAnimationInitial.toValue = NSNumber(value: buttonLHS )
        
        let labelFromRHSAnimation = CABasicAnimation(keyPath: "position.x")
        let buttonRHS: Double = Double(((animatedButtonImageStop.titleLabel?.frame.maxX)! + (animatedButtonImageStop.titleLabel?.frame.width)!)) + 15.0
        labelFromRHSAnimation.fromValue = NSNumber(value: buttonRHS)
        labelFromRHSAnimation.toValue = NSNumber(value: buttonMid)
        labelFromRHSAnimation.beginTime = 3.0
        labelFromRHSAnimation.duration = 2
        
        let labelFromMidAnimation = CABasicAnimation(keyPath: "position.x")
        labelFromMidAnimation.fromValue = NSNumber(value: buttonMid)
        labelFromMidAnimation.toValue = NSNumber(value: buttonLHS)
        labelFromMidAnimation.beginTime = 1.0
        labelFromMidAnimation.duration = 2
        
        let labelGroupAnimations = CAAnimationGroup()
        labelGroupAnimations.animations = [labelFromRHSAnimation, labelFromMidAnimation]
        labelGroupAnimations.duration = 6
        labelGroupAnimations.repeatCount = .infinity
        
        self.animatedButtonImageStop.titleLabel!.layer.add(labelGroupAnimations, forKey: "basicRep")
    }
    
    func animateButtonWithImage() {
        
        animatedButtonWithImage.clipsToBounds = true
        
        let labelAnimation = CABasicAnimation(keyPath: "position.x")
        labelAnimation.beginTime = 0.0
        labelAnimation.duration = 1.5
        
        let buttonRHS: Double = Double(((animatedButtonWithImage.titleLabel?.frame.maxX)! + (animatedButtonWithImage.titleLabel?.frame.width)!))
        let buttonLHS: Double = Double(((animatedButtonWithImage.titleLabel?.frame.minX)! - ((animatedButtonWithImage.titleLabel?.frame.width)!)))
        labelAnimation.fromValue = NSNumber(value: buttonRHS)
        labelAnimation.toValue = NSNumber(value: buttonLHS)
        labelAnimation.repeatCount = .infinity
        
        let imageAnimation = CABasicAnimation(keyPath: "position.x")
        let imageViewPadding: Double = Double((animatedButtonWithImage.imageView?.frame.width)!) + Double((animatedButtonWithImage.titleLabel?.frame.midX)!)
        imageAnimation.beginTime = 0.0
        imageAnimation.duration = 1.5
        
        let imageRHS: Double = buttonRHS - imageViewPadding
        let imageLHS: Double = buttonLHS - imageViewPadding
        imageAnimation.fromValue = NSNumber(value: imageRHS)
        imageAnimation.toValue = NSNumber(value: imageLHS)
        imageAnimation.repeatCount = .infinity
        
        self.animatedButtonWithImage.imageView!.layer.add(imageAnimation, forKey: "basic")
        
        self.animatedButtonWithImage.titleLabel!.layer.add(labelAnimation, forKey: "basic")
    }
    
    @objc private func buttonAction() {
        print ("Button Pressed")
    }
    
    // MARK: - IBAction
    @IBAction func typingButtonAction(_ sender: UIButton) {
        typingLabel.text = "Hey, I have something to say..."
        typingLabel.sizeToFit()
        typingLabel.animationType = .typewriter
        typingLabel.startAnimation(duration: 2.0, nil)
    }
    
    @IBAction func comingButtonAction(_ sender: UIButton) {
        comingLabel.text = "\"Stay hungry, stay foolish\" -- Steve Jobs"
        comingLabel.numberOfLines = 0
        comingLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        comingLabel.backgroundColor = .black
        comingLabel.textColor = .white
        comingLabel.animationType = .shine
        comingLabel.startAnimation(duration: 4.0, nil)
    }
    
    @IBAction func fadingButtonAction(_ sender: UIButton) {
        fading.text = "This is a fading text"
        fading.numberOfLines = 0
        fading.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        fading.animationType = .fade
        fading.startAnimation(duration: 2.0, nil)
    }
    
}
