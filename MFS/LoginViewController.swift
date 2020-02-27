//
//  LoginViewController.swift
//  MFS
//
//  Created by MOURITech on 27/02/20.
//  Copyright © 2020 MOURITech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {



    
    @IBOutlet weak var pinView: UIView!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var pinField: UITextField!
    @IBOutlet weak var loginAction: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var registerAction: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginAction.layer.cornerRadius = 30
        loginAction.layer.masksToBounds =  true
        
        mobileView.layer.borderWidth = 1.0
        mobileView.layer.borderColor = UIColor.lightGray.cgColor
        
        pinView.layer.borderWidth = 1.0
        pinView.layer.borderColor = UIColor.lightGray.cgColor
        
        
//        let path = UIBezierPath(roundedRect:self.view.bounds, byRoundingCorners:[.topRight, .topLeft], cornerRadii: CGSize(width: 30, height: 30))
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = self.view.bounds;
//        maskLayer.path = path.cgPath
//        bottomView.layer.mask = maskLayer;
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect:bottomView.bounds, byRoundingCorners:[.topRight, .topLeft], cornerRadii: CGSize(width: 30, height: 30)).cgPath
        bottomView.layer.mask = maskLayer;
      
    }
    
   
     @IBAction func loginAction(_ sender: Any) {
      
      //  loginAction.layer.cornerRadius = loginAction.height / 2
    }


}
