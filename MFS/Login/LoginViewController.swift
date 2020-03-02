//
//  LoginViewController.swift
//  MFS
//
//  Created by MOURITech on 27/02/20.
//  Copyright © 2020 MOURITech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    var mobileNumber = String()
    var pinNumber = String()
    var selectedTextField = UITextField()
    
    @IBOutlet weak var forgetPin: UILabel!
    @IBOutlet weak var pinView: UIView!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var pinField: UITextField!
    @IBOutlet weak var loginAction: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var registerAction: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberField.delegate = self
        pinField.delegate = self
        pinField.isSecureTextEntry = true
        loginAction.layer.cornerRadius = 30
        loginAction.layer.masksToBounds =  true
        forgetPin.isUserInteractionEnabled = true
        
        self.setUpLblTapped()
       // mobileView.layer.borderWidth = 1.0
       // mobileView.layer.borderColor = UIColor.lightGray.cgColor
        
       // pinView.layer.borderWidth = 1.0
       // pinView.layer.borderColor = UIColor.lightGray.cgColor
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect:bottomView.bounds, byRoundingCorners:[.topRight, .topLeft], cornerRadii: CGSize(width: 30, height: 30)).cgPath
        bottomView.layer.mask = maskLayer;
        
        
      

    }
    
    override func viewDidAppear(_ animated: Bool) {
          self.numberField.becomeFirstResponder()
        
        
        mobileView.layer.shadowColor = UIColor.gray.cgColor
        mobileView.layer.shadowOpacity = 1
        mobileView.layer.shadowOffset = .zero
        mobileView.layer.shadowRadius = 5
        
        pinView.layer.shadowColor = UIColor.gray.cgColor
        pinView.layer.shadowOpacity = 1
        pinView.layer.shadowOffset = .zero
        pinView.layer.shadowRadius = 5
        
        numberField.layer.masksToBounds = true
      }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == numberField){
          // ShowCustomAlert.sharedInstaic.showError(messge: "need to enter correct number")
        pinField.becomeFirstResponder()
          }
        else if(textField == pinField){
            pinField.resignFirstResponder()
        }
        return true
    }
    
    func setUpLblTapped(){
        
        let forgetPinGesture = UITapGestureRecognizer(target:self,action:#selector(self.forgetPinTap))
              forgetPin.addGestureRecognizer(forgetPinGesture)

    }
    func validation()
    {
        if(numberField.text == "")
        {
           self.numberField.becomeFirstResponder()
        }else if(pinField.text == "")
        {
           self.pinField.becomeFirstResponder()
        }
        
    }
    
     @IBAction func loginAction(_ sender: Any) {
    
        self.validation()
        mobileNumber = numberField.text!
        pinNumber = pinField.text!
        
        var parameters : [String: String] = ["Mobile" : mobileNumber,
        "Pin" : pinNumber]
       // ServiceManagerClass.serViceCallingforLogin(parameters, "url")
        
        let otpView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OTPViewController")as? OTPViewController
          self.navigationController?.pushViewController(otpView!, animated: true)
    }
  
    @objc func forgetPinTap() {
               print("tapped")
           }
         

}
