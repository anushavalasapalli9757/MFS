//
//  OTPViewController.swift
//  MFS
//
//  Created by SheebaT on 27/02/20.
//  Copyright © 2020 Mouritech. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var otpField: UITextField!
    @IBOutlet var view1: UIView!
    @IBOutlet weak var tiimerValue: UILabel!
    
    var timer = Timer()
    var seconds = <#value#>
    
    
       override func viewDidLoad() {
           super.viewDidLoad()
           view1.layer.masksToBounds = false
           view1?.layer.shadowColor = UIColor.black.cgColor
           view1?.layer.shadowOffset =  CGSize.zero
           view1?.layer.shadowOpacity = 0.5
           view1?.layer.shadowRadius = 4
       }

   func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }

    
}
