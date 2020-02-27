//
//  APIWapper.swift
//  SampleSwiftNotifiiConnect
//


import UIKit
import Alamofire

class APIWapper: SessionManager {
    
    //MARK: - SharedinstanceVariables

    var interNetRechability = Reachability()
    var actIndicator = UIActivityIndicatorView()
    var activityBGV = UIView()
    var noNetAlert = UIAlertController()
    var netConnectedAlert = UIAlertController()
    static var sharedObject = APIWapper()
    var length = 36
    var characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    var configuration = Configuration()
    //MARK: - SharedinstanceAPIWrapper
    class func shareHolder() -> APIWapper{
        sharedObject = APIWapper.init()
        return sharedObject;
    }
    init() {
        super.init();
        NotificationCenter.default.addObserver(self, selector:Selector(("netWorkStatusUpdate")), name:ReachabilityChangedNotification , object: nil)
        activityBGV = UIView.init()
      //  activityBGV.frame = (UIApplication.shared.delegate?.window??.frame)! as CGRect
        activityBGV.backgroundColor = UIColor.clear
      //  actIndicator.frame = (UIApplication.shared.delegate?.window??.frame)! as CGRect
       // activityBGV.center = (UIApplication.shared.delegate?.window??.center)!
        actIndicator.color = UIColor.darkGray
        actIndicator.center = activityBGV.center;
        autoreleasepool {
            activityBGV.addSubview(actIndicator)
        }
        UIApplication.shared.delegate?.window??.addSubview(activityBGV)
        actIndicator.isHidden = true;
    }
    
    //MARK: - InternetHandling Methods
    func netConnected()  {
        netConnectedAlert = UIAlertController.init(title: "Alert!", message: "netConnect", preferredStyle: .alert);
        let okAction : UIAlertAction = UIAlertAction.init(title: "OK", style:.cancel, handler: nil)
                netConnectedAlert.addAction(okAction);
      UIApplication.shared.delegate?.window??.rootViewController?.present(netConnectedAlert, animated: true, completion: nil);
         ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "You are now connected to the Internet.")
    }
    
    func isNetConnected() -> Bool{
        if interNetRechability?.currentReachabilityStatus == .notReachable{
            return false;
        }
        return true
    }
    
    func netDisConnected()  {
        self .stopActivityIndicator();
        ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.NO_NET_ALERT_MESSAGE)
    }
    
    //MARK: - ActivityIndicator Methods

    func startActivityIndictor() {
        activityBGV.isHidden = false
        actIndicator.startAnimating();
    }
    func stopActivityIndicator() {
        actIndicator.stopAnimating();
        activityBGV.isHidden = true;
    }
    
    //MARK: - NetworkStatus Methods

    func netWorkStatusUpdate()  {
        if interNetRechability?.currentReachabilityStatus == .notReachable {
            self.netDisConnected();
            return;
        }else if interNetRechability?.currentReachabilityStatus == .reachableViaWiFi{
            self.netConnected();
            
        }else if interNetRechability?.currentReachabilityStatus == .reachableViaWWAN{
            self.netConnected();
        }
    }
    
    //MARK: - Service Calling For Post Methods

    func serViceCalling(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSMutableDictionary?) -> Void , failure: @escaping (_ error: NSError?, _ statusCode: Int) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
        let token:String = (UserDefaults.standard.object(forKey: "token") as! String)
        let str = "Bearer" + " " + token
        
        let strDeviceModelOS = String(format:"DEVICE=%@; OS=%@;", UIDevice.current.model
            , UIDevice.current.systemVersion)
        //let correlationID = UIDevice.current.identifierForVendor?.uuidString
        
      
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let correlationID = String(randomCharacters)
        
        

        self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: JSONEncoding.default , headers: ["Authorization": str,"api-version": configuration.environment.appVersion, "client-type": "ATTENDANT","correlation-id": correlationID ?? "" ,"device-model": strDeviceModelOS]).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
            let statusCode = response.response?.statusCode
            print("correlationID:%@",correlationID)

            // self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: JSONEncoding.default , headers: nil).responseJSON { [unowned self] response in
            self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: JSONEncoding.default , headers: nil).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
                let statusCode = response.response?.statusCode
                if response.result.isSuccess{
                    print(response);
                    sucess ((response.result.value as! NSDictionary).mutableCopy() as? NSMutableDictionary)
                }else{
//                    print(response);
//                    failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
//                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                    if response.error?._code == -1009{
                        failure (response.result.error as NSError?,response.error?._code ?? 0 )
                 ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge:Constatns.WEAK_INTERNET_MESSAGE)
                    }else if response.error?._code == -1001 {
                      failure (response.result.error as NSError?,response.error?._code ?? 0 )
                  ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge:Constatns.WEAK_INTERNET_MESSAGE)
                    }
                    else{
                    failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
                    // 20/01/2020 - AVB
                    if statusCode != 401 {
                       ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                    }
//                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                    }
                }
            }
        }
    }
    
    func serViceCallingforLoginRefreshToken(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSMutableDictionary?) -> Void , failure: @escaping (_ error: NSError?, _ statusCode: Int) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
       // self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: JSONEncoding.default , headers: nil).responseJSON { [unowned self] response in
        let strDeviceModelOS = String(format:"DEVICE=%@; OS=%@;", UIDevice.current.model
            , UIDevice.current.systemVersion)
       // let correlationID = UIDevice.current.identifierForVendor?.uuidString
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let correlationID = String(randomCharacters)
        self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: JSONEncoding.default , headers: ["client-type": "ATTENDANT","api-version": configuration.environment.appVersion,"correlation-id": correlationID ?? "" ,"device-model": strDeviceModelOS]).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
            let statusCode = response.response?.statusCode
            print("HEADERSRESPONSE:%@",response.response?.allHeaderFields)
            print("correlationID:%@",correlationID)

            if response.result.isSuccess{
                print(response);
                sucess ((response.result.value as! NSDictionary).mutableCopy() as? NSMutableDictionary)
            }else{
                 if response.error?._code == -1009{
                    failure (response.result.error as NSError?,response.error?._code ?? 0 )
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                }else if response.error?._code == -1001 {
                  failure (response.result.error as NSError?,response.error?._code ?? 0 )
                  ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                 }
                 else {
                 failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
                    // 20/01/2020 - AVB
                    if statusCode != 401 {
                       ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                    }
//                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                  }
            }
        }
    }
    
    func serViceCallingforLogin(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSMutableDictionary?) -> Void , failure: @escaping (_ error: NSError?, _ statusCode: Int) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
        // self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: JSONEncoding.default , headers: nil).responseJSON { [unowned self] response in
        let strDeviceModelOS = String(format:"DEVICE=%@; OS=%@;", UIDevice.current.model
            , UIDevice.current.systemVersion)
       // let correlationID = UIDevice.current.identifierForVendor?.uuidString
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let correlationID = String(randomCharacters)
        self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: URLEncoding.default , headers: ["client-type": "ATTENDANT","api-version": configuration.environment.appVersion,"correlation-id": correlationID ?? "" ,"device-model": strDeviceModelOS]).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
            let statusCode = response.response?.statusCode
            print("HEADERSRESPONSE:%@",response.response?.allHeaderFields)
            print("correlationID:%@",correlationID)
            
            if response.result.isSuccess{
                print(response);
                sucess ((response.result.value as! NSDictionary).mutableCopy() as? NSMutableDictionary)
            }else{
                if response.error?._code == -1009{
                    failure (response.result.error as NSError?,response.error?._code ?? 0 )
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                }else if response.error?._code == -1001 {
                 failure (response.result.error as NSError?,response.error?._code ?? 0 )
                 ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                  }
                else{
                 failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
                    // 20/01/2020 - AVB
                    if statusCode != 401 {
                       ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                    }
//                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                  }
            }
        }
    }
    
    //MARK: - Service Calling For Post Methods
    
    func serViceCallingToValidateTicket(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSMutableDictionary?) -> Void , failure: @escaping (_ error: NSError?, _ statusCode: Int) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
        let token:String = (UserDefaults.standard.object(forKey: "token") as! String)
        let str = "Bearer" + " " + token
       //  self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: JSONEncoding.default , headers: ["Authorization": str]).responseJSON { [unowned self] response in
        let strDeviceModelOS = String(format:"DEVICE=%@; OS=%@;", UIDevice.current.model
            , UIDevice.current.systemVersion)
       // let correlationID = UIDevice.current.identifierForVendor?.uuidString
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let correlationID = String(randomCharacters)
      
        self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: JSONEncoding.default , headers: ["Authorization": str,"api-version": configuration.environment.appVersion, "client-type": "ATTENDANT","correlation-id": correlationID ?? "" ,"device-model": strDeviceModelOS]).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
            let statusCode = response.response?.statusCode
            print("HEADERSRESPONSE:%@",response.response?.allHeaderFields)
            print("correlationID:%@",correlationID)

                if response.result.isSuccess{
                print(response);
                sucess ((response.result.value as! NSDictionary).mutableCopy() as? NSMutableDictionary)
                }else{
               if response.error?._code == -1009{
                failure (response.result.error as NSError?,response.error?._code ?? 0 )
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                failure (response.result.error as NSError?,response.error?._code ?? 0 )
                }else if response.error?._code == -1001 {
                failure (response.result.error as NSError?,response.error?._code ?? 0 )
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                failure (response.result.error as NSError?,response.error?._code ?? 0 )
                  }
               else{
                 failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
//                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                  }
                }
        }
    }
    
    //MARK: - Service Calling For Get Methods to Array

    func getSerViceCallingWithRequest(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSMutableDictionary?) -> Void , failure: @escaping (_ error: NSError?, _ statusCode: Int) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
        let token:String = (UserDefaults.standard.object(forKey: "token") as! String)
        let str = "Bearer" + " " + token
        
        let strDeviceModelOS = String(format:"DEVICE=%@; OS=%@;", UIDevice.current.model
            , UIDevice.current.systemVersion)
        //let correlationID = UIDevice.current.identifierForVendor?.uuidString
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let correlationID = String(randomCharacters)
        self.request(url, method: .get , parameters: [:] , encoding: URLEncoding.default , headers: ["Authorization": str,"api-version": configuration.environment.appVersion, "client-type": "ATTENDANT","correlation-id": correlationID ?? "" ,"device-model": strDeviceModelOS]).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
            let statusCode = response.response?.statusCode
            print("HEADERSRESPONSE:%@",response.response?.allHeaderFields)
            print("correlationID:%@",correlationID)

            if response.result.isSuccess{
                print(response);
                sucess ((response.result.value as! NSDictionary).mutableCopy() as? NSMutableDictionary)
            }else{
               if response.error?._code == -1009{
                failure (response.result.error as NSError?,response.error?._code ?? 0 )
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                }else if response.error?._code == -1001 {
               failure (response.result.error as NSError?,response.error?._code ?? 0 )
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                 }
               else{
                 failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
                // 20/01/2020 - AVB
                if statusCode != 401 {
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                }
//                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                  }
            }
        }
    
    }
 
    //MARK: - Service Calling For Get Methods to Array
    func getSerViceCalling(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSArray?) -> Void , failure: @escaping (_ error: NSError?, _ statusCode: Int) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
        let token:String = (UserDefaults.standard.object(forKey: "token") as! String)
        let str = "Bearer" + " " + token
        let strDeviceModelOS = String(format:"DEVICE=%@; OS=%@;", UIDevice.current.model
            , UIDevice.current.systemVersion)
       // let correlationID = UIDevice.current.identifierForVendor?.uuidString
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let correlationID = String(randomCharacters)
        self.request(url, method: .get , parameters: [:] , encoding: URLEncoding.default , headers: ["Authorization": str,"api-version": configuration.environment.appVersion, "client-type": "ATTENDANT","correlation-id": correlationID ?? "" ,"device-model": strDeviceModelOS]).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
            
            print("API Response -------- %@", response.response as Any)
            
            let statusCode = response.response?.statusCode
            print("API Response status code -------- %@", statusCode as Any)
            
            print("correlationID:%@",correlationID)
            print("HEADERSRESPONSE:%@",response.response?.allHeaderFields)
                if response.result.isSuccess{
                print(response);
                    if ((response.result.value as? NSDictionary) != nil) {
                        var dict = NSDictionary()
                        dict = response.result.value as! NSDictionary
                        print("RES:%@",dict)
                        if let status = dict.value(forKey: "status") as? NSNumber {
                            let path:String = dict.value(forKey: "path") as? String ?? ""
                        if status == 611 && path.contains("/stand/list/") {
                            ShowCustomAlert().showErrorAlrrt(messge:dict.value(forKey: "message") as? String ?? "")
                           sucess (response.result.value as? NSArray)
                        } else  {
                            ShowCustomAlert().showErrorAlrrt(messge:dict.value(forKey: "message") as? String ?? "")
                            sucess (response.result.value as? NSArray)
                    }
                    }
                    }else {
                sucess (response.result.value as? NSArray)
                    }
                }else{
               if response.error?._code == -1009{
                failure (response.result.error as NSError?,response.error?._code ?? 0 )
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                }else if response.error?._code == -1001 {
                failure (response.result.error as NSError?,response.error?._code ?? 0 )
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                 }
               else{
                 failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
                
                // 20/01/2020 - AVB
                if statusCode != 401 {
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                }
                  }
                }
        }
    }
    //MARK: - Service Calling For Get Methods to Array
    
    func postSerViceCalling(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSArray?) -> Void , failure: @escaping (_ error: NSError?, _ statusCode: Int) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
        let token:String = (UserDefaults.standard.object(forKey: "token") as! String)
        let str = "Bearer" + " " + token
        let strDeviceModelOS = String(format:"DEVICE=%@; OS=%@;", UIDevice.current.model
            , UIDevice.current.systemVersion)
        //let correlationID = UIDevice.current.identifierForVendor?.uuidString
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let correlationID = String(randomCharacters)
        self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: JSONEncoding.default , headers: ["Authorization": str,"api-version": configuration.environment.appVersion, "client-type": "ATTENDANT","correlation-id": correlationID ?? "" ,"device-model": strDeviceModelOS]).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
            let statusCode = response.response?.statusCode
            print("HEADERSRESPONSE:%@",response.response?.allHeaderFields)
            print("correlationID:%@",correlationID)

            if response.result.isSuccess{
                print(response);
                sucess (response.result.value as? NSArray)
            }else{
                print(response);
                if response.error?._code == -1009{
                    failure (response.result.error as NSError?,response.error?._code ?? 0 )
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                }else if response.error?._code == -1001 {
                failure (response.result.error as NSError?,response.error?._code ?? 0 )
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                 }
                else{
                 failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
//                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                  }
            }
        }
    }

    //MARK: - Service Calling For Get Methods to Dictionary
    
    func getStartShiftSerViceCalling(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSMutableDictionary?) -> Void , failure: @escaping (_ error: NSError?, _ statusCode: Int) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
        let token:String = (UserDefaults.standard.object(forKey: "token") as! String)
        let str = "Bearer" + " " + token
        
        print("headers:%@", str)
        let strDeviceModelOS = String(format:"DEVICE=%@; OS=%@;", UIDevice.current.model
            , UIDevice.current.systemVersion)
       // let correlationID = UIDevice.current.identifierForVendor?.uuidString
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let correlationID = String(randomCharacters)
        self.request(url, method: .get , parameters:  [:]  , encoding: URLEncoding.default, headers: ["Authorization": str,"api-version": configuration.environment.appVersion, "client-type": "ATTENDANT","correlation-id": correlationID ?? "" ,"device-model": strDeviceModelOS]).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
            let statusCode = response.response?.statusCode
            print("HEADERSRESPONSE:%@",response.response?.allHeaderFields)
            print("correlationID:%@",correlationID)

        if response.result.isSuccess{
            print(response);
        sucess ((response.result.value as! NSDictionary).mutableCopy() as? NSMutableDictionary)
        }else{
           if response.error?._code == -1009{
               failure (response.result.error as NSError?,response.error?._code ?? 0 )
               ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
            }else if response.error?._code == -1001 {
           failure (response.result.error as NSError?,response.error?._code ?? 0 )
            ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
            }
           else{
             failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
            
            // 20/01/2020 - AVB
            if statusCode != 401 {
               ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
            }
//               ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
              }
        }
        }
    }
    
    //MARK: - Service Calling For Get Methods to Dictionary

    func getStartShiftSerViceCalling2(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSMutableDictionary?) -> Void , failure: @escaping (_ error: NSError?, _ statusCode: Int) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
        let token:String = (UserDefaults.standard.object(forKey: "token") as! String)
        let str = "Bearer" + " " + token
        
        print("headers:%@", str)
        let strDeviceModelOS = String(format:"DEVICE=%@; OS=%@;", UIDevice.current.model
            , UIDevice.current.systemVersion)
       // let correlationID = UIDevice.current.identifierForVendor?.uuidString
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let correlationID = String(randomCharacters)
        self.request(url, method: .get , parameters:  [:]  , encoding: URLEncoding.default, headers: ["Authorization": str,"api-version": configuration.environment.appVersion, "client-type": "ATTENDANT","correlation-id": correlationID ?? "" ,"device-model": strDeviceModelOS]).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
            let statusCode = response.response?.statusCode
            print("HEADERSRESPONSE:%@",response.response?.allHeaderFields)
            print("correlationID:%@",correlationID)

            if response.result.isSuccess{
                print(response);
                sucess ((response.result.value as! NSDictionary).mutableCopy() as? NSMutableDictionary)
            }else{
               if response.error?._code == -1009{
                   failure (response.result.error as NSError?,response.error?._code ?? 0 )
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                }else if response.error?._code == -1001 {
                failure (response.result.error as NSError?,response.error?._code ?? 0 )
                ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                }
               else{
                 failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
                // 20/01/2020 - AVB
                if statusCode != 401 {
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                }
//                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                  }
            }
        }
    }
    
    
    //MARK: - Service Calling For Post Methods to Dictionary
    func logoutServiceCall(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSMutableDictionary?) -> Void , failure: @escaping (_ error: NSError?, _ statusCode: Int) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
        if let token = (UserDefaults.standard.object(forKey: "token") as? String) {
            let str = "Bearer" + " " + token
            let strDeviceModelOS = String(format:"DEVICE=%@; OS=%@;", UIDevice.current.model
                , UIDevice.current.systemVersion)
         //   let correlationID = UIDevice.current.identifierForVendor?.uuidString
            let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
            let correlationID = String(randomCharacters)
//            "device-model" : [ "DEVICE=iPhone; OS=12.2;" ]
//
//            "correlation-id" : [ "A2A8AE48-89C9-49B1-87FC-69C2651FBE09" ],
//
//            "client-type" : [ "ATTENDANT" ],
            
            
            self.request(url, method: .post , parameters:  [:]  , encoding: URLEncoding.default, headers: ["Authorization": str,"api-version": configuration.environment.appVersion, "client-type": "ATTENDANT","correlation-id": correlationID ?? "" ,"device-model": strDeviceModelOS]).validate(statusCode: 200..<600).responseJSON { [unowned self] response in
                let statusCode = response.response?.statusCode
                print("HEADERSRESPONSE:%@",response.response?.allHeaderFields)
                print("correlationID:%@",correlationID)

                if response.result.isSuccess{
                    print(response);
                    sucess ((response.result.value as! NSDictionary).mutableCopy() as? NSMutableDictionary)
                }else{
                   if response.error?._code == -1009{
                       failure (response.result.error as NSError?,response.error?._code ?? 0 )
                       ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                    }else if response.error?._code == -1001 {
                    failure (response.result.error as NSError?,response.error?._code ?? 0 )
                    ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                    }
                   else{
                     failure (response.result.error as NSError?,response.response?.statusCode ?? 0 )
                    // 20/01/2020 - AVB
                    if statusCode != 401 {
                       ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                    }
//                       ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                      }
                }
            }
        }
    }
    //}
   
    //MARK: - Service Calling For Login pass parameters in header
    
    func serViceCallingForLogin(withUrl : NSString,  withParameters : NSDictionary, sucess:@escaping (_ response: NSMutableDictionary?) -> Void , failure: @escaping (_ error: NSError?) -> Void )
    {
        let url:URL = URL.init(string: configuration.environment.baseURL.appending(withUrl as String))!
        let str = String(format:"DEVICE=%@; OS=%@; APP=Connect; VERSION=%@", UIDevice.current.model
            , UIDevice.current.systemVersion, (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!)
        
        self.request(url, method: .post , parameters: withParameters as? Parameters , encoding: JSONEncoding.default , headers: ["User-Agent":str]).responseJSON { [unowned self] response in
            
            if response.result.isSuccess{
                print(response);
                sucess ((response.result.value as! NSDictionary).mutableCopy() as? NSMutableDictionary)
            }else{
                print(response);
//                failure (response.result.error as NSError?)
//                  ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                
                if response.error?._code == -1009{
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                }else if response.error?._code == -1001 {
                 ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.WEAK_INTERNET_MESSAGE)
                }
                else{
                 failure (response.result.error as NSError?)
                   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: Constatns.API_ERROR_MESSAGE)
                  }
            }
        }
    }
    
}


