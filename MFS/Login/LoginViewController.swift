//
//  LoginViewController.swift
//  MFS
//
//  Created by MOURITech on 27/02/20.
//  Copyright © 2020 MOURITech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {



    
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
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target:#selector(donedatePicker), action: #selector(LoginViewController.donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target:#selector(cancelDatePicker), action: #selector(LoginViewController.cancelDatePicker))
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        // add toolbar to textField
        numberField.inputAccessoryView = toolbar
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect:bottomView.bounds, byRoundingCorners:[.topRight, .topLeft], cornerRadii: CGSize(width: 30, height: 30)).cgPath
        bottomView.layer.mask = maskLayer;
      
    }
    
    @objc func donedatePicker(){
        //For date formate
        numberField.resignFirstResponder()
    }
    
    @objc func cancelDatePicker(){
        //cancel button dismiss datepicker dialog
        self.view.endEditing(true)
    }
    
    
    //MARK:- UIALert Message
    
    func alertAction(_ msgStr: String?) {
        let alert = UIAlertController(title: nil, message: msgStr, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
   
     @IBAction func loginAction(_ sender: Any) {
        if (numberField.text == "") {
            alertAction("Please Enter Mobile Number")
        }
        else if (pinField.text == ""){
            alertAction("Please Enter Pin")
        }
        else {
            let otpView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OTPViewController")as? OTPViewController
            self.navigationController?.pushViewController(otpView!, animated: true)
        }
    }
    
    //MARK: - UITEXTFIELD DELEGATE METHODS
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == pinField) {
            pinField.resignFirstResponder()
        }
        return true
    }


}
