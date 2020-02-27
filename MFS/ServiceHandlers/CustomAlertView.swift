//
//  CustomAlertView.swift
//  Notifii Connect Managers App
//
//  Created by DevRabbit on 15/11/17.
//  Copyright © 2017 DevRabbit. All rights reserved.
//

import UIKit

class CustomAlertView: UIView {
    
    var alertViewBGV:UIView!
    var isSeesionExpired:Bool!
    var isPopNavigation:Bool!
    var isNavigateToSpecificController : Bool!
    var isrefreshtoken:Bool!
    
    var withPresentViewController:UIViewController!
    weak var customAlertDelegate:CustomAlertViewDelegate?
    override init(frame:CGRect) {
        super.init(frame:frame)
        isSeesionExpired = false;
        isPopNavigation = false;
        isNavigateToSpecificController = false;
    }
    
    
    convenience init(image:UIImage, title:String, message:String, numberOfButtons:[String],withViewController:UIViewController){
        let windoww = UIWindow(frame: UIScreen.main.bounds)
        self.init(frame:(windoww.frame) as! CGRect )
        self.backgroundColor = UIColor.init(white: 0.0, alpha: 0.6)
        //self.alpha = 0.8
        let xPostion  = (FontsAndColors.ISPHONE_5 ? 20 :(FontsAndColors.ISIPAD ?150 : 40))
        withPresentViewController = withViewController;
        
        alertViewBGV = UIView.init(frame: CGRect.init(x: CGFloat(xPostion), y:80 , width:self.frame.size.width - CGFloat(2 * xPostion), height: numberOfButtons.count>0 ? 150 : 200));
        
        var heigtOfText = self.heightForView(text: message, font: FontsAndColors.LABLE_FONT!, width: alertViewBGV.frame.size.width-20);
        
        if(numberOfButtons.count>0){
            heigtOfText = self.heightForView(text: message, font: FontsAndColors.CANCEL_YES_NO_MESSAGE_POPUP_FONT, width: alertViewBGV.frame.size.width-20);
        }
        
        alertViewBGV = UIView.init(frame: CGRect.init(x: CGFloat(xPostion), y:80 , width:self.frame.size.width-CGFloat(2 * xPostion), height: numberOfButtons.count>0 ? 165 + heigtOfText : 200+heigtOfText));
        
        if(self.frame.size.height - 200 < alertViewBGV.frame.size.height ){
            alertViewBGV = UIView.init(frame: CGRect.init(x: CGFloat(xPostion), y:80 , width:self.frame.size.width-CGFloat(2 * xPostion), height: self.frame.size.height-200));
        }
        alertViewBGV.backgroundColor = UIColor.white;
        alertViewBGV.layer.cornerRadius = 10.0
        alertViewBGV.layer.masksToBounds = true
        alertViewBGV.center = self.center
        
        
        var y  = 25;
        // add Image if have;
        // if(numberOfButtons.count == 0){
        var imageView = UIImageView()
        //  let imageView = UIImageView.init(frame: CGRect.init(x: (alertViewBGV.frame.size.width/2)-50, y: CGFloat(15), width: 40, height: 40))
        
        if(numberOfButtons.count == 0){
            let tap = UITapGestureRecognizer(target: self, action:#selector(handleTap))
            imageView.isUserInteractionEnabled = true
            alertViewBGV.addGestureRecognizer(tap)
        }
        //imageView.backgroundColor = UIColor.blue
        
        y = y + 80;
        //  }
        
        // add Title if have
        if (title != "") {
            
            //            let errorbutton = UIButton()
            //            errorbutton.frame = CGRect(x:100, y:y-15, width:80, height:40)
            //            errorbutton.setImage(UIImage.init(named: "Error") , for: .normal)
            //
            //            alertViewBGV.addSubview(errorbutton)
            var titleLable = UILabel()
            
            
            
            //titleLable.backgroundColor = UIColor.red
            //  titleLable.textColor = UIColor.red
            //  UIDeisgnMethods.addFontAndTextColorToLable(label: titleLable);
            
            
            if(title == "Oops!"){
                imageView = UIImageView.init(frame: CGRect.init(x: (alertViewBGV.frame.size.width/2)-50, y: CGFloat(15), width: 40, height: 40))
                
                titleLable = UILabel.init(frame: CGRect.init(x: Int(imageView.frame.origin.x + imageView.frame.size.width + 10), y: 21, width: Int(alertViewBGV.frame.size.width/2 - 30), height: 26))
                titleLable.textColor = UIColor(red: 26/255, green: 35/255, blue: 126/255, alpha: 1.0)
            }else if(title == "Success!" ){
                imageView = UIImageView.init(frame: CGRect.init(x: (alertViewBGV.frame.size.width/2)-65, y: CGFloat(15), width: 40, height: 40))
                titleLable = UILabel.init(frame: CGRect.init(x: Int(imageView.frame.origin.x + imageView.frame.size.width + 10), y: 21, width: Int(alertViewBGV.frame.size.width/2 - 30), height: 26))
                titleLable.textColor = UIColor(red: 120/255, green: 224/255, blue: 143/255, alpha: 1.0)
                
            }
            else if(title == "Warning!" ){
                titleLable.textColor = UIColor.darkGray
            }else if(title == "Error!" ){
                imageView = UIImageView.init(frame: CGRect.init(x: (alertViewBGV.frame.size.width/2)-50, y: CGFloat(15), width: 40, height: 40))
                
                titleLable = UILabel.init(frame: CGRect.init(x: Int(imageView.frame.origin.x + imageView.frame.size.width + 10), y: 21, width: Int(alertViewBGV.frame.size.width/2 - 30), height: 26))
                titleLable.textColor = UIColor(red: 162/255, green: 19/255, blue: 22/255, alpha: 1.0)
                
            }else if(title == "Delink confirmation" ){
                imageView = UIImageView.init(frame: CGRect.init(x: (alertViewBGV.frame.size.width/2)-125, y: CGFloat(15), width: 40, height: 40))
                
                titleLable = UILabel.init(frame: CGRect.init(x: Int(imageView.frame.origin.x + imageView.frame.size.width + 10), y: 21, width: Int(alertViewBGV.frame.size.width/2 + 30), height: 26))
                titleLable.textColor = UIColor(red: 26/255, green: 35/255, blue: 126/255, alpha: 1.0)
                
            }
            titleLable.text = title;
            titleLable.font = UIFont.init(name:"OpenSans-Regular", size: 20)
            // titleLable.textAlignment = .left
            
            alertViewBGV.addSubview(imageView)
            imageView.image = image;
            alertViewBGV.addSubview(titleLable)
            y = y + 36;
        }
        
        //add message if have
        if(message != ""){
            let messageScrollView : UIScrollView = UIScrollView.init(frame: CGRect.init(x: 10, y: (numberOfButtons.count > 0 ? 60 : y), width: Int(alertViewBGV.frame.size.width-20), height: Int(numberOfButtons.count>0 ?alertViewBGV.frame.size.height-150 : alertViewBGV.frame.size.height-110)))
            messageScrollView.backgroundColor = UIColor.white;
            messageScrollView.showsHorizontalScrollIndicator = false;
            messageScrollView.showsVerticalScrollIndicator = false;
            // messageScrollView.backgroundColor = UIColor.yellow
            
            
            let messageLbl : UILabel = UILabel.init(frame: CGRect.init(x: 0, y:10, width: messageScrollView.frame.size.width, height: heigtOfText+2))
            //messageLbl.backgroundColor = UIColor.purple
            UIDeisgnMethods.addFontAndTextColorToLable(label: messageLbl);
            
            if(numberOfButtons.count > 0 ){
                // UIDeisgnMethods.addFontAndTextColorToSubjectLable(label: messageLbl)
                messageLbl.textColor = UIColor.darkGray
            }
            
            
            messageLbl.text = message;
            messageLbl.lineBreakMode = .byWordWrapping;
            messageLbl.numberOfLines = 0
            messageLbl.textAlignment = .center
            //messageLbl.sizeToFit();
            
            messageScrollView.addSubview(messageLbl);
            // messageScrollView.contentSize = CGSize.init(width: messageScrollView.frame.size.width, height: messageLbl.frame.size.height+20)
            
            alertViewBGV.addSubview(messageScrollView)
        }
        
        // add if have buttons
        
        if(numberOfButtons.count > 0){
            if numberOfButtons.count == 1 {
                let button1 : UIButton = UIButton.init(frame:CGRect.init(x: 0, y: alertViewBGV.frame.size.height-70, width: alertViewBGV.frame.size.width, height: 72))
                button1.setTitle(numberOfButtons[0], for: .normal)
                button1.setImage(UIImage.init(named: "") , for: .normal)
                button1.setTitleColor(UIColor(red: 26/255, green: 35/255, blue: 126/255, alpha: 1.0), for: .normal)
                button1.titleLabel?.font =  UIFont.init(name:"OpenSans-Regular", size: 16)
                button1.layer.addBorder(edge: UIRectEdge.top, color: FontsAndColors.TEXTFIELD_BORDER_COLOR, thickness: (FontsAndColors.ISIPAD ? 2 :1))
                button1.layer.addBorder(edge: UIRectEdge.right, color: FontsAndColors.TEXTFIELD_BORDER_COLOR, thickness: 1)
                button1.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 0.0, right: 0.0)
                button1.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -5.0, bottom: 0.0, right: 5.0)
                button1.tag = 1;
                button1.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
                alertViewBGV.addSubview(button1)
            } else {
                let button1 : UIButton = UIButton.init(frame:CGRect.init(x: 0, y: alertViewBGV.frame.size.height-70, width: alertViewBGV.frame.size.width/2, height: 72))
                button1.setTitle(numberOfButtons[0], for: .normal)
                button1.setImage(UIImage.init(named: "") , for: .normal)
                button1.setTitleColor(UIColor(red: 26/255, green: 35/255, blue: 126/255, alpha: 1.0), for: .normal)
                button1.titleLabel?.font =  UIFont.init(name:"OpenSans-Regular", size: 16)
                button1.layer.addBorder(edge: UIRectEdge.top, color: FontsAndColors.TEXTFIELD_BORDER_COLOR, thickness: (FontsAndColors.ISIPAD ? 2 :1))
                button1.layer.addBorder(edge: UIRectEdge.right, color: FontsAndColors.TEXTFIELD_BORDER_COLOR, thickness: 1)
                button1.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 0.0, right: 0.0)
                button1.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -5.0, bottom: 0.0, right: 5.0)
                button1.tag = 1;
                button1.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
                alertViewBGV.addSubview(button1)
                // button1.backgroundColor = UIColor.gray
                let button2 : UIButton = UIButton.init(frame:CGRect.init(x: alertViewBGV.frame.size.width/2, y: alertViewBGV.frame.size.height-70, width: alertViewBGV.frame.size.width/2, height: 72))
                button2.setTitle(numberOfButtons[1], for: .normal)
                button2.setImage(UIImage.init(named: "") , for: .normal)
                button2.setTitleColor(UIColor(red: 26/255, green: 35/255, blue: 126/255, alpha: 1.0), for: .normal)
                button2.titleLabel?.font =  UIFont.init(name:"OpenSans-Regular", size: 16)
                button2.layer.addBorder(edge: UIRectEdge.top, color: FontsAndColors.TEXTFIELD_BORDER_COLOR, thickness: (FontsAndColors.ISIPAD ? 2 :1))
                button2.layer.addBorder(edge: UIRectEdge.right, color: FontsAndColors.TEXTFIELD_BORDER_COLOR, thickness: 1)
                button2.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 0.0, right: 0.0)
                button2.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -5.0, bottom: 0.0, right: 5.0)
                button2.tag = 2;
                button2.addTarget(self, action: #selector(pressButton2(_:)), for: .touchUpInside)
                alertViewBGV.addSubview(button1)
                alertViewBGV.addSubview(button2)
            }
        }
        self.addSubview(alertViewBGV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
    
    
    
    @objc func handleTap() {
        
        // if sestion expired
        if (isSeesionExpired) {
            ValidationsClass.makeAppLogout()
            isSeesionExpired  = false;
        }
        // if navigate to privious page with success alert
        
        if (isPopNavigation) {
            self.withPresentViewController.navigationController?.popViewController(animated: true)
            isPopNavigation = false;
        }
        
        if(isNavigateToSpecificController == true){
            self.customAlertDelegate?.forNavigateToSpecificController!()
            isNavigateToSpecificController = false;
        }
        
        self.removeFromSuperview();
        
        
    }
    
    
    @objc func pressButton(_ button: UIButton) {
        print("Button with tag: \(button.currentTitle ?? "") clicked!")
        self.removeFromSuperview();
        self.customAlertDelegate?.selectedButtonIndex!(selectedButtonIndex: button.tag)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "removealert"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "removesmsalert"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "removekeyfobalert"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "removeticketalert"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "removeNotificationsalert"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "removeReparkalert"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "removeSendEmailalert"), object: nil)
        //"popToDashboard"
          NotificationCenter.default.post(name: NSNotification.Name(rawValue: "popToDashboard"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "poptoClaimsList"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Refreshtokekexpirypopup"), object: nil)
//        if strScreenForStands == "STANDS" {
////            print("Anusha")
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "removeTaxesNotCongigured"), object: nil)
//
//        }
        
//        if strScreenForCancel == "Cancel" {
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "removeDelinkalert"), object: nil)
//        }
//        if strScreenFromPay == "EMAIL" {
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "emailReceipForPay"), object: nil)
//        }
//        if strScreenOkButtonforEmailReceipt == "CheckedOut"{
//          NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CheckedOut"), object: nil)
//            strScreenOkButtonforEmailReceipt = ""
//        }
//       if CheckinPaymentsuccess == "Successfully paid by Cash."{
//          NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Checkinpoptodashboard"), object: nil)
//        CheckinPaymentsuccess = ""
//        }
//        if (isrefreshToken == "Refresh"){
//            isrefreshToken = "NotRefresh"
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            storyBoard.instantiateInitialViewController()
//            let vc =  storyBoard.instantiateViewController(withIdentifier: "ViewController")
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.window?.rootViewController = vc
//        }
        
        
    }
    @objc func pressButton2(_ button: UIButton){
        let strFirstTime = NSString()
        if button.titleLabel?.text == "Email Receipt" {
//            var email = String()
//            email =  UserDefaults.standard.value(forKey: "emailReceipt") as? String ?? ""
//            if email == "Receipt" {
//              self.removeFromSuperview()
//            } else {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "emailReceiptalert"), object: nil)
            self.removeFromSuperview()
            //}
        } else {
       // strScreenForCancel = ""
        print("Anu")
        self.removeFromSuperview();
        }
    }
    
}

@objc protocol CustomAlertViewDelegate:class {
    @objc optional func selectedButtonIndex(selectedButtonIndex : Int )
    @objc optional func forNavigateToSpecificController( )
}


extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}
