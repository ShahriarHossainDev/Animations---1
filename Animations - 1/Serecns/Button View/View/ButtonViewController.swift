//
//  ButtonViewController.swift
//  Animations - 1
//
//  Created by Shishir_Mac on 22/3/23.
//

import UIKit

class ButtonViewController: UIViewController {
    @IBOutlet weak var pulseButton: UIButton!
    @IBOutlet weak var flashButton: UIButton!
    @IBOutlet weak var shakeButton: UIButton!
    @IBOutlet weak var tadaButton: UIButton!
    @IBOutlet weak var rotationButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var ballButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var swingButton: UIButton!

    let defaultDuration = 2.0
    let defaultDamping = 0.20
    let defaultVelocity = 6.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pulseButton.layer.cornerRadius = 8
        flashButton.layer.cornerRadius = 8
        shakeButton.layer.cornerRadius = 8
        heartButton.layer.cornerRadius = 8
        tadaButton.layer.cornerRadius = 8
        rotationButton.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
        swingButton.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    @IBAction func pulseButtonAction(_ sender: UIButton) {
        sender.ButtonPulse()
    }
    
    @IBAction func flashButtonAction(_ sender: UIButton) {
        sender.ButtonFlash()
    }
    
    @IBAction func heartButtonAction(_ sender: UIButton) {
        sender.heartbeat()
    }
    
    @IBAction func shakeButtonAction(_ sender: UIButton) {
        sender.ButtonShake()
    }
    
    @IBAction func ballButtonAction(_ sender: UIButton) {
        sender.ButtonBounce()
    }
    
    @IBAction func tadaButtonAction(_ sender: UIButton) {
        sender.ButtonTada()
    }
    
    @IBAction func RotationButtonAction(_ sender: UIButton) {
        sender.ButtonRotates()
    }
    @IBAction func SwingButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func NextButtonAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "secVC") as! ButtonSecViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
