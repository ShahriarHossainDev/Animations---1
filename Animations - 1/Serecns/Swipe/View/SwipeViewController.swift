//
//  SwipeViewController.swift
//  Animations - 1
//
//  Created by Shishir_Mac on 22/3/23.
//

import UIKit

class SwipeViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previewButton: UIButton!
    @IBOutlet weak var viewSwipePageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        print("Next")
    }
    
    @IBAction func previewButtonAction(_ sender: UIButton) {
        print("PreView")
    }
    
}
