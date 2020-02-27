//
//  OTPViewController.swift
//  MFS
//
//  Created by SheebaT on 27/02/20.
//  Copyright © 2020 Mouritech. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {

     @IBOutlet var view1: UIView!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view1.layer.masksToBounds = false
           view1?.layer.shadowColor = UIColor.black.cgColor
           view1?.layer.shadowOffset =  CGSize.zero
           view1?.layer.shadowOpacity = 0.5
           view1?.layer.shadowRadius = 4
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
