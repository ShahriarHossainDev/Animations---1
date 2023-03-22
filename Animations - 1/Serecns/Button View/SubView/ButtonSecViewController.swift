//
//  ButtonSecViewController.swift
//  Animations - 1
//
//  Created by Shishir_Mac on 22/3/23.
//

import UIKit

class ButtonSecViewController: UIViewController {
    
    var buttonWork = UIButton()
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oneButton.layer.cornerRadius = 8
        twoButton.layer.cornerRadius = 8
        threeButton.layer.cornerRadius = 8
        buttonbu()
        // Do any additional setup after loading the view.
    }
    
    
    func buttonbu() {
        
        let xOpen = oneButton.frame.origin.x - 400
        let yOpen = oneButton.frame.origin.y
        
        let width = oneButton.frame.size.width
        let height = oneButton.frame.size.height
        
        self.oneButton.frame = CGRect(x: xOpen, y: yOpen, width: width, height: height)
        
        let xscepen = oneButton.frame.origin.x + 500
        
        UIView.animate(withDuration: 1.0, animations: {
            self.oneButton.frame = CGRect(x: xscepen, y: yOpen, width: width, height: height)
            
        })
        
        let xspen = twoButton.frame.origin.x - 400
        let yspen = twoButton.frame.origin.y
        
        let swidth = twoButton.frame.size.width
        let sheight = twoButton.frame.size.height
        
        self.twoButton.frame = CGRect(x: xspen, y: yspen, width: swidth, height: sheight)
        
        let xsscepen = twoButton.frame.origin.x + 500
        
        UIView.animate(withDuration: 2.0, animations: {
            self.twoButton.frame = CGRect(x: xsscepen, y: yspen, width: swidth, height: sheight)
        })
        
        let xtpen = threeButton.frame.origin.x - 400
        let ytpen = threeButton.frame.origin.y
        
        let twidth = threeButton.frame.size.width
        let theight = threeButton.frame.size.height
        
        self.threeButton.frame = CGRect(x: xtpen, y: ytpen, width: twidth, height: theight)
        
        let tsscepen = threeButton.frame.origin.x + 500
        
        UIView.animate(withDuration: 3.0, animations: {
            self.threeButton.frame = CGRect(x: tsscepen, y: ytpen, width: twidth, height: theight)
        })
        
    }
}
