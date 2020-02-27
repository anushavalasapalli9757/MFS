//
//  ShowCustomAlert.swift
//  Notifii Connect Managers App
//
//  Created by DevRabbit on 15/11/17.
//  Copyright © 2017 DevRabbit. All rights reserved.
//

import UIKit

class ShowCustomAlert: NSObject,CustomAlertViewDelegate {
    static let sharedInstaic = ShowCustomAlert()
    
    var presentViewController  = UIViewController()
    
    func showErrorAlrrt(messge:String){
        let alert : CustomAlertView = CustomAlertView.init(image: UIImage.init(named:"Error")!, title: "Error!", message: messge, numberOfButtons: ["OK"], withViewController: presentViewController)
        alert.isPopNavigation = false
        UIApplication.shared.delegate?.window??.addSubview(alert)
    }
    // Autologout error alert
    
    func showError(messge:String){
        let alert : CustomAlertView = CustomAlertView.init(image: UIImage.init(named:"Error")!, title: "Error!", message: messge, numberOfButtons: ["OK"], withViewController: presentViewController)
        alert.isPopNavigation = false
        let view = UIApplication.shared.delegate?.window??.subviews
//        let check =  view?.contains(where: { $0.isKind(of: CustomAlertView.self) })
//        let check =  view?.contains(alert)
//        if check == false  {
            UIApplication.shared.delegate?.window??.addSubview(alert)
       // }
       // UIApplication.shared.delegate?.window??.addSubview(alert)
    }
    
    func showOopsAlrrt(messge:String){
        let alert : CustomAlertView = CustomAlertView.init(image: UIImage.init(named:"Information Icon")!, title: "Oops!", message: messge, numberOfButtons: ["OK"], withViewController: presentViewController)
        alert.isPopNavigation = false
        UIApplication.shared.delegate?.window??.addSubview(alert)
    }
    
    func showSessionExpairedAlert (messge:String){
        let alert : CustomAlertView = CustomAlertView.init(image: UIImage.init(named: "Information Icon")!, title: "Delink confirmation", message: messge, numberOfButtons: ["OK","Cancel"], withViewController: presentViewController)
        alert.isPopNavigation = false;
        UIApplication.shared.delegate?.window??.addSubview(alert)
    }
    func showEmailReceiptAlert (messge:String){
        let alert : CustomAlertView = CustomAlertView.init(image: UIImage.init(named: "success")!, title: "Success!", message: messge, numberOfButtons: ["OK","Email Receipt"], withViewController: presentViewController)
        alert.isPopNavigation = false;
        UIApplication.shared.delegate?.window??.addSubview(alert)
    }
   func showSucessAlert(messge:String){
        let alert : CustomAlertView = CustomAlertView.init(image: UIImage.init(named: "success")!, title: "Success!", message: messge, numberOfButtons: ["OK"], withViewController: presentViewController)
        alert.isSeesionExpired = false;
        alert.isPopNavigation = false;
//        if isforautologout == "autologout"{
//            isforautologout = ""
//        }else
//        {
          UIApplication.shared.delegate?.window??.addSubview(alert)
        //}
    }
    
    func showSucessAlertWithViewController(messge:String,withTitle:String,presentViewController:UIViewController){
        let alert : CustomAlertView = CustomAlertView.init(image: UIImage.init(named: "success.png")!, title: withTitle, message: messge, numberOfButtons: [], withViewController: presentViewController)
        self.presentViewController  = presentViewController;
        alert.customAlertDelegate = self;
        alert.isPopNavigation = true
        UIApplication.shared.delegate?.window??.addSubview(alert)
    }
    
    func showWorningAlrrt(messge:String){
        let alert : CustomAlertView = CustomAlertView.init(image: UIImage.init(named: "PopupWarningIcon.png")!, title: "Warning!", message: messge, numberOfButtons: [], withViewController: presentViewController)
        UIApplication.shared.delegate?.window??.addSubview(alert)
    }
    func forPopNavigationtoLogin() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        storyBoard.instantiateInitialViewController()
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ViewController")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vc
    }
    
    
    //MARK:- CUSTOME ALERTVIEWDELEGA
    
    func forPopNavigation() {
        self.presentViewController.navigationController?.popViewController(animated:true)
    }
    
    func selectedButtonIndex(selectedButtonIndex: Int) {
        
    }
    
    
}
