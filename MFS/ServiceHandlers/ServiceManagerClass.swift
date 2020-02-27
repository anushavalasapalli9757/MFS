//
//  ServiceManagerClass.swift
//  Notifii Connect Managers App
//
//  Created by DevRabbit on 23/11/17.
//  Copyright © 2017 DevRabbit. All rights reserved.
//

import UIKit

class ServiceManagerClass: NSObject {
    

    static let sharedInstance =  ServiceManagerClass()
    
   
    weak var servicemanagerDelegate : ServiceManagerClassDelegate?
     var  string = NSString()
    
    
    func serViceCallingforLoginRefreshToken(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.serViceCallingforLoginRefreshToken(withUrl:withExtentionURL as NSString , withParameters: withRequest , sucess: { [weak self] response in
            service.stopActivityIndicator();
                if let status = response?.value(forKey: "status") as? NSNumber {
                    if status == 401 {
                        ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                       // isrefreshToken = "Refresh"
                    }
                }
                self?.servicemanagerDelegate?.serviceResponse(responseObject: response!)
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    func serViceCallingforLogin(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.serViceCallingforLogin(withUrl:withExtentionURL as NSString , withParameters: withRequest , sucess: { [weak self] response in
            service.stopActivityIndicator();
            if let status = response?.value(forKey: "status") as? NSNumber {
                if status == 401 {
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                    isrefreshToken = "Refresh"
                }
            }
            self?.servicemanagerDelegate?.serviceResponse(responseObject: response!)
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    func serviceCalling(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.serViceCalling(withUrl:withExtentionURL as NSString , withParameters: withRequest , sucess: { [weak self] response in
            service.stopActivityIndicator();
                if let status = response?.value(forKey: "status") as? NSNumber {
                    if status == 401 {
                        ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                        isrefreshToken = "Refresh"
                    }
                }
                self?.servicemanagerDelegate?.serviceResponse(responseObject: response!)
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    
    func serviceCallingForValidateTicket(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.serViceCallingToValidateTicket(withUrl:withExtentionURL as NSString , withParameters: withRequest , sucess: { response in
            if let status = response?.value(forKey: "status") as? NSNumber {
                if status == 401 {
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                    isrefreshToken = "Refresh"
                }
            }
            service.stopActivityIndicator();
            self.servicemanagerDelegate?.serviceResponse(responseObject: response!)
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    func serviceCallingForlogout(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.serViceCallingToValidateTicket(withUrl:withExtentionURL as NSString , withParameters: withRequest , sucess: { response in
            service.stopActivityIndicator();
            if let status = response?.value(forKey: "status") as? NSNumber {
                if status == 401 {
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                    isrefreshToken = "Refresh"
                }
            }
            self.servicemanagerDelegate?.serviceResponse(responseObject: response!)
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
     
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    //getSerViceCallingWithRequest
    func getServiceCallingWithRequest(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.getSerViceCallingWithRequest(withUrl:withExtentionURL as NSString , withParameters: [:] , sucess: { response in
            service.stopActivityIndicator();
            if let status = response?.value(forKey: "status") as? NSNumber {
                if status == 401 {
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                    isrefreshToken = "Refresh"
                }
            }
            if (response == nil) {
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "No Response from API!")
            }
            else {
                self.servicemanagerDelegate?.serviceResponse(responseObject: response!)
            }
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    
    func getServiceCalling(withRequest:NSDictionary, withExtentionURL:String){
//        gjghf
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.getSerViceCalling(withUrl:withExtentionURL as NSString , withParameters: [:] , sucess: { response in
            service.stopActivityIndicator();
            if let status = response?.value(forKey: "status") as? NSNumber {
                if status == 401 {
                   // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.value(forKey: "message") as! String)
                    isrefreshToken = "Refresh"
                }
            }
            print("resp:%@",response)
          
            if (response == nil) {
                
            }
            else {
            self.servicemanagerDelegate?.serviceResponse1(responseObject: response!)
              }
        }) { error,statusCode in
            service.stopActivityIndicator();
           // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    
    func postServiceCalling(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.postSerViceCalling(withUrl:withExtentionURL as NSString , withParameters: withRequest , sucess: { response in
            service.stopActivityIndicator();
            print("resp:%@",response)
          
            // if(ValidationsClass.ckeckNullvalidation(dictionray:
            //response!, key: "error").contains("Error")){
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.value(forKey: "message") as! String)
            if let status = response?.value(forKey: "status") as? NSNumber {
                if status == 401 {
                   // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.value(forKey: "message") as! String)
                    isrefreshToken = "Refresh"
                }
            }
            if (response == nil) {
                
            }
            else {
                self.servicemanagerDelegate?.serviceResponse1(responseObject: response!)
            }
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    func getShiftStartServiceCalling(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.getStartShiftSerViceCalling(withUrl:withExtentionURL as NSString , withParameters: [:] , sucess: { response in
            
            service.stopActivityIndicator();
            if let status = response?.value(forKey: "status") as? NSNumber {
                if status == 401 {
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                    isrefreshToken = "Refresh"
                }
            }
            print("resp:%@",response)
            if (response == nil) {
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "No Response from API!")
                return
            }
            if(ValidationsClass.ckeckNullvalidation(dictionray:
                response!, key: "error").contains("Error")){
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
            } else {
            self.servicemanagerDelegate?.serviceResponse(responseObject: response!)
              }
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    func getingecoServiceCalling(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.getStartShiftSerViceCalling2(withUrl:withExtentionURL as NSString , withParameters: [:] , sucess: { response in
            
            service.stopActivityIndicator();
            if let status = response?.value(forKey: "status") as? NSNumber {
                if status == 401 {
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                    isrefreshToken = "Refresh"
                }
            }
            print("resp:%@",response)
            if (response == nil) {
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "No Response from API!")
                return
            }
            if(ValidationsClass.ckeckNullvalidation(dictionray:
                response!, key: "error").contains("Error")){
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
            } else {
                self.servicemanagerDelegate?.serviceResponse(responseObject: response!)
            }
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    
    func getDashBoardServiceCalling(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.getStartShiftSerViceCalling(withUrl:withExtentionURL as NSString , withParameters: [:] , sucess: { response in
            
            service.stopActivityIndicator();
            if let status = response?.value(forKey: "status") as? NSNumber {
                if status == 401 {
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                    isrefreshToken = "Refresh"
                }
            }
            print("resp:%@",response)
            if (response == nil) {
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "No Response from API!")
                return
            }
            if(ValidationsClass.ckeckNullvalidation(dictionray:
                response!, key: "error").contains("Error")){
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                
            } else {
                self.servicemanagerDelegate?.serviceResponse(responseObject: response!)
            }
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
    func logoutServiceCall(withRequest:NSDictionary, withExtentionURL:String){
        let service : APIWapper = APIWapper.init();
        if !service.isNetConnected() {
            service.netDisConnected();
            return;
        }
        service.startActivityIndictor();
        service.logoutServiceCall(withUrl:withExtentionURL as NSString , withParameters: [:] , sucess: { response in
            
            service.stopActivityIndicator();
            if let status = response?.value(forKey: "status") as? NSNumber {
                if status == 401 {
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: response?.object(forKey:"message") as! String)
                    isrefreshToken = "Refresh"
                }
            }
            print("resp:%@",response)
            
            
            self.servicemanagerDelegate?.serviceResponse(responseObject: response!)
            //   }
        }) { error,statusCode in
            service.stopActivityIndicator();
            // ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "Something went wrong.")
            
            self.servicemanagerDelegate?.serviceFailureResponse(responseObject: statusCode)
            print(error!);
        }
    }
}
protocol ServiceManagerClassDelegate:AnyObject {
    func serviceResponse(responseObject: NSMutableDictionary)
    func serviceResponse1(responseObject: NSArray)
    func serviceFailureResponse(responseObject: Int)
    

}


