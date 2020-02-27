//
//  ViewController.swift
//  MFS
//
//  Created by Mouritech on 18/02/20.
//  Copyright © 2020 Mouritech. All rights reserved.
//

import UIKit

var serviceCallFrom : String!

class ViewController: UIViewController,ServiceManagerClassDelegate {
    
    var window: UIWindow?

    @IBOutlet weak var btnSwitch: UISwitch!
    
    func serviceResponse(responseObject: NSMutableDictionary) {
     
        
        if(serviceCallFrom == Constatns.LOGIN_URL) {
            let aryRes:NSArray = responseObject.allKeys as NSArray
            if aryRes.contains("status") {
                if let status = responseObject.value(forKey: "status") as? NSInteger {
                    if status == 200 {
                        UserDefaults.standard.set(nil, forKey: "CarMakeId")
                             UserDefaults.standard.set(nil, forKey: "strModelID")
                             UserDefaults.standard.set(nil, forKey: "strColorID")
                        ShowCustomAlert().showSucessAlert(messge:(responseObject.value(forKey: "message") as? String)!)
                    }
                    else if status == 500 {
                        ShowCustomAlert().showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                    }
                    else {
                        if (responseObject.value(forKey: "message") as? NSString) != nil {
                    ShowCustomAlert().showErrorAlrrt(messge:(responseObject.value(forKey: "message") as? String)!)
                        }
                        else{
                    ShowCustomAlert().showErrorAlrrt(messge:Constatns.API_ERROR_MESSAGE)
                        }
                    }
                }
            } 
            
        }
 
    }
    
    func serviceResponse1(responseObject: NSArray) {
        
    }
    
    func serviceFailureResponse(responseObject: Int) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        btnSwitch.addTarget(self, action: #selector(ViewController.sampleSwitchValueChanged(sender:)), for: UIControl.Event.valueChanged)

    }
    @objc func sampleSwitchValueChanged(sender: UISwitch!)
    {
        if sender.isOn {

            print("switch to light")
//            window?.overrideUserInterfaceStyle = .light
//            self.view.overrideUserInterfaceStyle = .light
            UIApplication.shared.windows.forEach{ window in
                window.overrideUserInterfaceStyle = .light
            }

        } else {
            print("switch to dark")
//            window?.overrideUserInterfaceStyle = .dark
//            self.view.overrideUserInterfaceStyle = .dark
            UIApplication.shared.windows.forEach{ window in
                           window.overrideUserInterfaceStyle = .dark
                       }

        }
    }
    
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        if traitCollection.userInterfaceStyle == .dark
//        {
//            
//        }
//        else{
//            
//        }
//    }
//    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
//        if traitCollection.userInterfaceStyle == .dark
//        {
//            
//        }
//        else{
//            
//        }
//    }
    
    
    @IBAction func btnNextClicked(_ sender: UIButton) {
       
                    self.makeLoginServiceCalling()
            
    }

    func makeLoginServiceCalling(){
        let strEmployeeID = "Imranm"
        var configuration = Configuration()
        print(configuration.environment.apiKey)
        let requestDict: NSDictionary = NSDictionary.init(objects: [configuration.environment.apiKey,strEmployeeID ?? "", strEmployeeID ?? ""], forKeys: ["apiKey" as NSCopying ,"username" as NSCopying, "password" as NSCopying ])
        ServiceManagerClass.sharedInstance.serViceCallingforLogin(withRequest: requestDict, withExtentionURL: Constatns.LOGIN_URL)
        ServiceManagerClass.sharedInstance.servicemanagerDelegate = self;
        serviceCallFrom = Constatns.LOGIN_URL;
        
    }
}

