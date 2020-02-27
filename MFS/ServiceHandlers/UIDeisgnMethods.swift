//
//  UIDeisgnMethods.swift
//  Notifii Connect Managers App
//
//  Created by DevRabbit on 14/11/17.
//  Copyright © 2017 DevRabbit. All rights reserved.
//

import UIKit

class UIDeisgnMethods: NSObject {
    //MARK:- LOGIN VIEW CONTROLLER
static func addBorderToTextField(textField:UITextField){
    textField.layer.borderColor = FontsAndColors.TEXTFIELD_BORDER_COLOR.cgColor
    textField.layer.borderWidth = 1.0;
    textField.layer.cornerRadius =  5.0
    textField.layer.masksToBounds = true;
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.size.height))
    textField.leftView = paddingView
    textField.leftViewMode = .always
    }
    static func addBorderToButton(button:UIButton){
        button.layer.cornerRadius =  5.0
        button.layer.masksToBounds = true
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.13).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 10
    }
   static func addBorderTextViews(textVw:UITextView) {
        textVw.layer.borderColor = UIColor.init(red:234/255, green:234/255, blue:234/255, alpha:1).cgColor
        textVw.layer.borderWidth = 0.5;
        textVw.layer.cornerRadius =  3.0
        textVw.layer.masksToBounds = true;
    }
    static func dashboardboader(button:UIButton){
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 1.0;
        button.layer.cornerRadius =  5.0
        button.layer.masksToBounds = true
    }
    static func caraddBorderToButton(button:UIButton){
        button.layer.borderColor = FontsAndColors.BUTTON_BORDER_COLOR.cgColor
        button.layer.cornerRadius =  5.0
        button.layer.masksToBounds = true
    }
    
    static func utcConversion(dateFormatter:DateFormatter) {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    }
    
    static func addBorderToButton1(button:UIButton){
        button.layer.borderWidth = 0.1;
        button.layer.cornerRadius =  2.0
        button.layer.masksToBounds = true
    }
    static func addShadowEffectToView(view:UIView){
        view.layer.cornerRadius = 10.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 6
    }
    static func uiviewDesign(view:UIView) {
        view.layer.cornerRadius = 3
        view.layer.borderWidth = 0.1
        view.clipsToBounds = false
        view.layer.shadowRadius = 0.1
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.1
    }
    static func vwBgDesign(view:UIView) {
        view.clipsToBounds = false
        view.layer.cornerRadius = 3
        view.layer.shadowRadius = 0.1
        view.layer.shadowColor = UIColor.init(red:240/255, green:240/255, blue:240/255, alpha:1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.1
        view.layer.borderWidth = 0.1
    }
    static func clearMemory() {
        UserDefaults.standard.set(nil, forKey: "rahul")
        UserDefaults.standard.set(nil, forKey: "SmsTicketNo")
        UserDefaults.standard.set(nil, forKey: "QRTicketNumber")
        UserDefaults.standard.set(nil, forKey: "RetrieveTicketNumber")
        UserDefaults.standard.set(nil, forKey: "scanKeyFobTicketNumber")
        UserDefaults.standard.set(nil, forKey: "NewTicketNumber")
        UserDefaults.standard.set(nil, forKey: "CustomerName")
        UserDefaults.standard.set(nil, forKey: "CustomerNumber")
        UserDefaults.standard.set(nil, forKey: "CustomerLicense")
        UserDefaults.standard.set(nil, forKey: "CustomerVIN")
        UserDefaults.standard.set(nil, forKey: "CarModelId")
        UserDefaults.standard.set(nil, forKey: "CarModelName")
        UserDefaults.standard.set(nil, forKey: "ColorName")
        UserDefaults.standard.set(nil, forKey: "ScanKeyFobKeyTicketNumber")
        UserDefaults.standard.set(nil, forKey: "savecarmake")
        UserDefaults.standard.set(nil, forKey: "savecarcolour")
        UserDefaults.standard.set(nil, forKey: "savecarmodel")
      //  UserDefaults.standard.set(nil, forKey: "Cuemail")
        UserDefaults.standard.set(nil,forKey: "ticketForUnPaid")
        UserDefaults.standard.set(nil,forKey: "ticketForActive")
        UserDefaults.standard.set(nil,forKey: "ticketForPaid")
        UserDefaults.standard.set(nil,forKey: "ticketForRetrivalRequests")
     //claimmangement
        UserDefaults.standard.set(nil, forKey: "turnedon")
        UserDefaults.standard.set(nil, forKey: "ticketmarked")
        UserDefaults.standard.set(nil, forKey: "incidentdate")
        UserDefaults.standard.set(nil, forKey: "claimticket2")
        UserDefaults.standard.set(nil, forKey: "policee")
        UserDefaults.standard.set(nil, forKey: "claimresent")
        UserDefaults.standard.set(nil, forKey: "hotelguest")
        UserDefaults.standard.set(nil, forKey: "desctext")
        UserDefaults.standard.set(nil, forKey: "manuyear")
        UserDefaults.standard.set(nil, forKey: "vinnum")
        UserDefaults.standard.set(nil, forKey: "Licplatenum")
        UserDefaults.standard.set(nil, forKey: "custname")
        UserDefaults.standard.set(nil, forKey: "address1")
        UserDefaults.standard.set(nil, forKey: "address2")
        UserDefaults.standard.set(nil, forKey: "city")
        UserDefaults.standard.set(nil, forKey: "statess")
        UserDefaults.standard.set(nil, forKey: "zip")
        UserDefaults.standard.set(nil, forKey: "phonenumber")
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.set(nil, forKey: "lots")
        UserDefaults.standard.set(nil, forKey: "Naidu")
        UserDefaults.standard.set(nil, forKey: "frontbumper")
        UserDefaults.standard.set(nil, forKey: "doors")
        UserDefaults.standard.set(nil, forKey: "boonettrue")
        UserDefaults.standard.set(nil, forKey: "rooftrue")
        UserDefaults.standard.set(nil, forKey: "wheeldamage")
        UserDefaults.standard.set(nil, forKey: "windshield")
        UserDefaults.standard.set(nil, forKey: "windows")
        UserDefaults.standard.set(nil, forKey: "side")
        UserDefaults.standard.set(nil, forKey: "RightFrontCar")
        UserDefaults.standard.set(nil, forKey: "RightRearCar")
        UserDefaults.standard.set(nil, forKey: "TireRim")
        UserDefaults.standard.set(nil, forKey: "checkWindShield")
        UserDefaults.standard.set(nil, forKey: "RightRearDoor")
        UserDefaults.standard.set(nil, forKey: "SideMirrorsOfCar")
        UserDefaults.standard.set(nil, forKey: "WindowsOfCar")
        UserDefaults.standard.set(nil, forKey: "NewTicketFlowTicketNumber")
    }
    static func addShadowEffectToView1(view:UIView){
        view.layer.cornerRadius = 5.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 15
    }
    static func shadowcliamToView1(view:UIView){
        view.layer.cornerRadius = 1.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.init(red:228/255, green:228/255, blue:228/255, alpha:1).cgColor
    }
    static func addShadowEffectToView3(view:UIView){
        view.layer.cornerRadius = 3.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 8
    }
    static func addShadowEffectToView2(view:UIView){
        view.layer.cornerRadius = 2.0
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 10
        view.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.14).cgColor
    }
    static func addBorderToView(view:UIView){
        view.layer.borderColor =  FontsAndColors.BORDER_COLOR.cgColor
        view.layer.borderWidth = 1.0;
        view.layer.cornerRadius =  5.0
        view.layer.masksToBounds = true;
    }
    static func addBorderToPedbutton(button:UIButton){
        button.layer.borderColor = UIColor.init(red:234/255, green:234/255, blue:234/255, alpha:1).cgColor
        button.layer.borderWidth = 0.5;
        button.layer.cornerRadius =  3.0
        button.layer.masksToBounds = true;
    }
    static func scanPedbutton(button:UIButton){
        button.layer.borderColor = UIColor.init(red:234/255, green:234/255, blue:234/255, alpha:1).cgColor
        button.layer.borderWidth = 0.5;
        //  button.layer.cornerRadius =  3.0
        button.layer.masksToBounds = true;
    }
    static func addBorderToPedimage(image:UIImageView){
        image.layer.borderColor = UIColor.init(red:234/255, green:234/255, blue:234/255, alpha:1).cgColor
        image.layer.borderWidth = 0.5;
        image.layer.cornerRadius =  3.0
        image.layer.masksToBounds = true;
    }
    static func addViewCornerRadius(view:UIView){
        view.layer.cornerRadius =  5.0
        view.layer.masksToBounds = true
    }
    
    static func addBorderToTextFieldsforCash(view: UIView) {
        view.clipsToBounds = false
        view.layer.cornerRadius = 2
        view.layer.shadowRadius = 0.1
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.1
        view.layer.borderWidth = 0.1
    }
   
    static func addFontTOButton(button:UIButton){
        button.titleLabel?.font = FontsAndColors.TEXTFEILD_FONT
    }
    
   static func addFontTOBackButton(button:UIButton){
        button.titleLabel?.font = FontsAndColors.BACK_BUTTON_FONT
    }
    
   static func addFontAndColorSortingButtonButton(button:UIButton){
        button.titleLabel?.font = FontsAndColors.SORTING_BUTTON_TEXT_FONT
        button.setTitleColor(FontsAndColors.LABEL_TEXT_COLOR, for: .normal)
    }
   static func addBorderToTextView(textView:UITextView){
        textView.layer.borderColor = FontsAndColors.TEXTFIELD_BORDER_COLOR.cgColor
        textView.layer.borderWidth = 1.0;
        textView.layer.cornerRadius =  5.0
        textView.layer.masksToBounds = true;
        textView.font = FontsAndColors.TEXTFEILD_FONT
        textView.textColor = FontsAndColors.TEXTFEILD_TEXT_COLOR
        textView.backgroundColor = FontsAndColors.TEXTFEILD_BACKGROUND_COLOR
    }
    static func addBorderforClaimTextView(claimTextView:UITextView){
        claimTextView.layer.cornerRadius = 3
        claimTextView.layer.borderWidth = 0.1
        claimTextView.clipsToBounds = false
        claimTextView.layer.shadowRadius = 0.1
        claimTextView.layer.shadowColor = UIColor.gray.cgColor
        claimTextView.layer.shadowOffset = CGSize(width: 0, height: 1)
        claimTextView.layer.shadowOpacity = 0.1
    }
    static func addTextvwBorderforClaimStep5(txtView:UITextView) {
        txtView.isUserInteractionEnabled = false
        txtView.layer.cornerRadius =  3.0
        txtView.layer.masksToBounds = true;
        txtView.textColor = UIColor.darkGray
        txtView.isScrollEnabled = false
        txtView.isHidden = true
        txtView.sizeToFit()
    }
    static func addBorderCornerRadiustoCells(cell:UICollectionViewCell){
        cell.layer.cornerRadius = 5.0
        cell.layer.borderWidth = 1.0
        cell.layer.masksToBounds = true
    }
    static func addFontAndTextColorToUnitNumeberAndNameLable(label:UILabel){
        label.textColor = FontsAndColors.RESIDENTNAME_UNITNUMBER_TEXTCOLOR;
        label.font = FontsAndColors.RESIDENTNAME_UNITNUMBER_TEXTFONT
    }
    static func addBorderCornerRadiustoTextFields(textField:UITextField){
        textField.layer.borderColor = FontsAndColors.BORDER_COLOR.cgColor
        textField.layer.cornerRadius = 3.0
        textField.layer.borderWidth = 1.0
        textField.layer.masksToBounds = true
    }
    static func addFontAndTextColorToLable(label:UILabel){
        label.textColor = FontsAndColors.LABEL_TEXT_COLOR;
        label.font = FontsAndColors.LABLE_FONT
    }
    
static func addBorderAndBGColorToSaveButton(button:UIButton){
        button.layer.borderColor = FontsAndColors.BUTTON_BORDER_COLOR.cgColor
        button.layer.borderWidth = 1.0;
        button.layer.cornerRadius =  3.0
        button.layer.masksToBounds = true;
        button.backgroundColor = FontsAndColors.SAVE_BUTTON_BG_COLOR;
        button.setTitleColor(FontsAndColors.SAVE_BUTTON_TEXT_COLOR, for: .normal)
        button.titleLabel?.font = FontsAndColors.SAVE_BUTTON_FONT
    }
    static func addBorderAndBGColorToCancelButton(button:UIButton){
        button.layer.borderColor = FontsAndColors.BUTTON_BORDER_COLOR.cgColor
        button.layer.borderWidth = 1.0;
        button.layer.cornerRadius =  3.0
        button.layer.masksToBounds = true;
        button.backgroundColor =  UIColor.init(red: 152.0/255.0, green: 173.0/255.0, blue: 204.0/255.0, alpha: 1.0);
        button.setTitleColor(FontsAndColors.SAVE_BUTTON_TEXT_COLOR, for: .normal)
        button.titleLabel?.font = FontsAndColors.SAVE_BUTTON_FONT
    }
    static func addFontAndTextColorToLblLogInAndForgotPassword(label:UILabel){
        label.textColor = FontsAndColors.FORGOTPASS_BUTTON_TEXT_COLOR 
        label.font = FontsAndColors.FORGOTPASS_LABEL_FONT;
    }
    //MARK:- ADD TEXT FONT AND COLOR TO FORGOTPASSWORD AND NEVERGIE UP BUUTONS
   static func addFontAndTextColorToForgotAndNevermindButtonsLogInAndForgotPassword(button:UIButton){
        button.setTitleColor(FontsAndColors.FORGOTPASS_BUTTON_TEXT_COLOR, for: .normal)
        button.titleLabel?.font = FontsAndColors.FORGOTPASS_BUTTON_FONT;
    }
    //MARK:- HEADRVIEW BGCOLOR AND TITLE COLOR
   static func addBGColorToHeaderView(view:UIView){
        view.backgroundColor = FontsAndColors.HEADER_VIEW_BG_COLOR;
    }
   static func addFontAndTextColorToHeaderLabel(label:UILabel){
        label.textColor = FontsAndColors.HEADER_VIEW_TITLE_TEXT_COLOR;
        label.font = FontsAndColors.HEADER_VIEW_TITLE_FONT
    }
    //MARK:- SQUARE CROPING IMAGEVIEW AND LABLE
   static func makeCirecleAnImageView(imageView:UIImageView)
    {
    imageView.layer.cornerRadius = imageView.frame.size.width/2;
    imageView.layer.masksToBounds = true;
    }
   static func addBorderToAnImageView(imageView:UIImageView)
    {
    imageView.layer.borderColor = UIColor.lightGray.cgColor ;
    imageView.layer.borderWidth = 2.0;
    imageView.layer.masksToBounds = true
    }
   static func makeCirecleAnLable(label:UILabel)
    {
        label.layer.cornerRadius = label.frame.size.width/2;
        label.textColor = FontsAndColors.IMG_PLACEHOLDER_LBL_TEXT_COLOR;
        label.backgroundColor = FontsAndColors.IMG_PLACEHOLDER_TEXT_LBL_BGCOLOR
        label.textAlignment = .center
        label.layer.masksToBounds = true;
    }
    
    static func makeCirecleAnLableForResidents(label:UILabel)
    {
        label.layer.cornerRadius = label.frame.size.width/2;
        label.textAlignment = .center
        label.layer.masksToBounds = true;
    }
  
    //MARK:- ADD TEXTCOLOR AND BGCRPUND COLOR TO A LEBLE TO TABLEVIEW HEADER
   static func addFontAndTextColorToLblForTableViewHeaderWithBGColor(label:UILabel){
       label.textColor = FontsAndColors.TABLEVIEW_HEADER_LABLE_TEXT_COLOR
       label.textAlignment = .center
       label.font = FontsAndColors.TABLEVIEW_VIEW_HEADER_LABLE_TITLE_FONT;
       label.backgroundColor = FontsAndColors.TABLEVIEW_HEADER_LABLE_BG_COLOR;
    }
//MARK:- SHEDULED AND EMIAL MESSAGE DESIGN METHODS
static func addFontAndTextColorToLblForDateAndSubjectTitle(label:UILabel){
        label.textColor = FontsAndColors.EMAI_SHEDULE_MESSAGE_SUBJECT_AND_DATE_LABEL_TEXT_COLOR
        label.font = FontsAndColors.EMAI_SHEDULE_MESSAGE_SUBJECT_AND_DATE_LABEL_FONT;
    }
static func addFontAndTextColorToSubjectLable(label:UILabel){
        label.textColor = FontsAndColors.EMAI_SHEDULE_MESSAGE_SUBJECT_TEXT_COLOR
        label.font = FontsAndColors.RESIDENTNAME_UNITNUMBER_TEXTFONT;
    
    }
static func addFontAndTextColorToDetalsLable(label:UILabel){
        label.textColor = FontsAndColors.EMAI_SHEDULE_MESSAGE_DETAILS_TEXT_COLOR
        label.font = FontsAndColors.EMAI_SHEDULE_MESSAGE_DETAILS_FONT;
    }
static func addFontAndTextColorToChatListDateLable(label:UILabel){
        label.textColor = FontsAndColors.EMAI_SHEDULE_MESSAGE_DETAILS_TEXT_COLOR
        label.font = FontsAndColors.CHAT_LIST_DATE_FONT;
    }
    static func addFontAndTextColorToChatListMessagePreview(label:UILabel){
        label.textColor = FontsAndColors.EMAI_SHEDULE_MESSAGE_DETAILS_TEXT_COLOR
        label.font = FontsAndColors.CHAT_LIST_DATE_FONT;
    }
//MARK:- ADD PADDING VIEW TO TEXTFEILD
static func addPaddingViewToTextFeild(withImage:UIImage,WithMode:String,textFeild:UITextField){
        var paddingView : UIView = UIView.init(frame: CGRect.init(x: 0, y:0, width:25, height: textFeild.frame.size.height-20))
        var imageView = UIImageView.init(frame: CGRect.init(x: 8, y: 0, width: paddingView.frame.size.width-5, height: paddingView.frame.size.height))
        imageView.image = withImage;
        imageView.contentMode = .scaleAspectFit;
        paddingView.addSubview(imageView)
        if(WithMode == "left"){
         textFeild.leftView = paddingView;
            textFeild.leftViewMode = .always;
        }
        else{
        paddingView = UIView.init(frame: CGRect.init(x: 0, y:0, width:60, height: textFeild.frame.size.height-20))
        imageView = UIImageView.init(frame: CGRect.init(x: 8, y: 0, width: paddingView.frame.size.width-15, height: paddingView.frame.size.height))
            imageView.image = withImage;
         imageView.contentMode = .scaleAspectFit;
            paddingView.addSubview(imageView)
            textFeild.rightView = paddingView;
            textFeild.rightViewMode = .always;
           textFeild.rightView = paddingView;
        textFeild.rightViewMode = .always;
        }
        textFeild.font = FontsAndColors.TEXTFEILD_FONT;
        textFeild.textColor = FontsAndColors.TEXTFEILD_TEXT_COLOR
        textFeild.layer.borderWidth = 1.0
        textFeild.layer.borderColor = FontsAndColors.TEXTFIELD_BORDER_COLOR.cgColor;
        textFeild.layer.cornerRadius = 5.0
        textFeild.layer.masksToBounds = true;
    }
    
    static func addPaddingViewToTextFeildWithDropDownArrow(withImage:UIImage,WithMode:String,textFeild:UITextField){
        var paddingView : UIView = UIView.init(frame: CGRect.init(x: 0, y:0, width:25, height: textFeild.frame.size.height-20))
        var imageView = UIImageView.init(frame: CGRect.init(x: 8, y: 0, width: paddingView.frame.size.width-5, height: paddingView.frame.size.height))
        imageView.image = withImage;
        imageView.contentMode = .scaleAspectFit;
        paddingView.addSubview(imageView)
        if(WithMode == "left"){
            textFeild.leftView = paddingView;
            textFeild.leftViewMode = .always;
        }
        else{
            paddingView = UIView.init(frame: CGRect.init(x: 0, y:0, width:35, height: textFeild.frame.size.height-20))
            imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: paddingView.frame.size.width-15, height: 30))
            imageView.image = withImage;
            imageView.contentMode = .scaleAspectFit;
            paddingView.addSubview(imageView)
            textFeild.rightView = paddingView;
            textFeild.rightViewMode = .always;
            textFeild.rightView = paddingView;
            textFeild.rightViewMode = .always;
        }
        textFeild.font = FontsAndColors.TEXTFEILD_FONT;
        textFeild.textColor = FontsAndColors.TEXTFEILD_TEXT_COLOR
        textFeild.layer.borderWidth = 1.0
        textFeild.layer.borderColor = FontsAndColors.TEXTFIELD_BORDER_COLOR.cgColor;
        textFeild.layer.cornerRadius = 5.0
        textFeild.layer.masksToBounds = true;
    }
    //MARK:- MORE VIEWCONTROLLER
    static func addFontAndTextColorToAptName(label:UILabel){
        label.textColor = FontsAndColors.NAME_LABEL_COLOR;
        label.font = FontsAndColors.NAME_TEXT_FONT;
    }
    static func addFontAndTextColorToName(label:UILabel){
        label.textColor = UIColor.lightGray;
        label.font = FontsAndColors.APT_NAME_TEXT_FONT;
    }
    static func addFontAndTextColorToMoreTableViewLbl(label:UILabel){
        label.textColor = FontsAndColors.MORE_TABLEVIEW_LBL_COLOR;
        label.font = FontsAndColors.MORE_TABLEVIEW_LBL_FONT;
    }
    static func DashboardBorderToView(view:UIView){
        view.layer.shadowOffset = CGSize.zero
        view.layer.cornerRadius = 3
    }
    static func DashboardBorderToButton(button:UIButton){
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.12).cgColor
        button.layer.shadowOpacity = 1
        button.layer.cornerRadius = 3
        button.layer.shadowRadius = 15
    }
    static func resizedCroppedImage(image: UIImage, newSize:CGSize) -> UIImage {
        var ratio: CGFloat = 0
        var delta: CGFloat = 0
        var offset = CGPoint.zero
        if image.size.width > image.size.height {
            ratio = newSize.width / image.size.width
            delta = (ratio * image.size.width) - (ratio * image.size.height)
            offset = CGPoint(x: delta / 2, y: 0)
        } else {
            ratio = newSize.width / image.size.height
            delta = (ratio * image.size.height) - (ratio * image.size.width)
            offset = CGPoint(x: 0, y: delta / 2)
        }
        let clipRect = CGRect(x: -offset.x, y: -offset.y, width: (ratio * image.size.width) + delta, height: (ratio * image.size.height) + delta)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0.0)
        UIRectClip(clipRect)
        image.draw(in: clipRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if newImage != nil {
        return newImage!
        }
        return image
    }
    static func convertMinAndHoursToUSerReadbleFormatRetrival (labelText:UILabel, ParkTime:String) {
        let paltime = NSInteger(ParkTime)
        let hours = 0
        let minutes = paltime
        let strJustNow:String = "Just now"
        if let pal = paltime, pal <= 59 {
            if minutes == 0 {
                labelText.text = strJustNow
            }
            else if minutes == 1{
                labelText.text  = String(format: "%d min ago",minutes  as! CVarArg)
            }
            else{
                labelText.text  = String(format: "%d mins ago",minutes  as! CVarArg)
            }
        } else {
            var hours = (paltime! / 60)
            let days = (hours / 24)
            let week = days/7
            let month = days / 30
            print("\(days)")
            let minutes = (paltime! % 60)
            print(hours)
            print(minutes)
            if days == 0 {
                if hours == 0 {
                    if minutes == 0 {
                        labelText.text = strJustNow
                    }
                     if minutes == 1 {
                        labelText.text = String(format: " %d min ago",minutes  as CVarArg)
                    }else{
                        labelText.text = String(format: " %d mins ago",minutes  as CVarArg)
                    }
                }
                if hours == 1 {
                    if minutes == 0 {
                        labelText.text = String(format: "%d hr",hours  as CVarArg)
                    }
                    else if minutes == 1 {
                        labelText.text = String(format: "%d hr %d min ago",hours,minutes  as CVarArg)
                    }else{
                        labelText.text = String(format: "%d hr %d mins ago",hours,minutes  as CVarArg)
                    }
                }else{
                    if minutes == 0 {
                        labelText.text = String(format: "%d hrs",hours  as CVarArg)
                    }
                    else if minutes == 1 {
                        labelText.text = String(format: "%d hrs %d min ago",hours,minutes  as CVarArg)
                    }else{
                        labelText.text = String(format: "%d hrs %d mins ago",hours,minutes  as CVarArg)
                    }
                }
            }
            else if days == 1 {
                if hours == 0 {
                    labelText.text = String(format: "%d day",days  as CVarArg)
                }
                else if hours == 1 {
                    labelText.text = String(format: "%d day %d hr ago",days,hours  as CVarArg)
                }else{
                    if hours > 24 {
                        if hours == 0 {
                            labelText.text = String(format: "%d day",days  as CVarArg)
                        }
                        if hours == 1 {
                            labelText.text = String(format: "%d day %d hr ago",days,hours  as CVarArg)
                        } else {
                            labelText.text = String(format: "%d day %d hrs ago",days,hours  as CVarArg)
                        }
                    }
                    if hours >= 24 {
                        let days = hours / 24
                        let rem = hours % 24
                        if rem == 1 {
                            labelText.text = String(format: "%d day %d hr ago",days,rem  as CVarArg)
                        }
                        else if rem == 0 {
                            labelText.text = String(format: "%d day",days  as CVarArg)
                        } else {
                            labelText.text = String(format: "%d day %d hrs ago",days,rem  as CVarArg)
                        }
                    }
                }
            }
            else if week == 1 {
                if days == 0 {
                    labelText.text = String(format: "%d week",week  as CVarArg)
                }
                else if days == 1 {
                    labelText.text = String(format: "%d week %d day ago",week,days  as CVarArg)
                }else{
                    if days > 7 {
                        if days == 0 {
                            labelText.text = String(format: "%d week",week  as CVarArg)
                        }
                        else if days == 1 {
                            labelText.text = String(format: "%d week %d day ago",week,days  as CVarArg)
                        } else {
                            labelText.text = String(format: "%d week %d days ago",week,days  as CVarArg)
                        }
                    }
                    if days >= 7 {
                        let week = days/7
                        let rem = days % 7
                        if rem == 0 {
                            labelText.text = String(format: "%d week",week  as CVarArg)
                        }
                        else if rem == 1 {
                            labelText.text = String(format: "%d week %d day ago",week,rem  as CVarArg)
                        } else {
                            labelText.text = String(format: "%d week %d days ago",week,rem  as CVarArg)
                        }
                    }
                }
            }
            else {
                if week > 1 {
                    if days == 0 {
                        labelText.text = String(format: "%d week",week  as CVarArg)
                    }
                    if days == 1 {
                        labelText.text = String(format: "%d week %d day ago",week,days  as CVarArg)
                    } else {
                        if days < 7 {
                            if days == 0 {
                                labelText.text = String(format: "%d week",week  as CVarArg)
                            }
                            if days == 1 {
                                labelText.text = String(format: "%d week %d day ago",week,days  as CVarArg)
                            } else {
                                labelText.text = String(format: "%d week %d days ago",week,days  as CVarArg)
                            }
                        }
                        if days >= 7 {
                            let week = days/7
                            let rem = days % 7
                            if rem == 0 {
                                if week <= 1 {
                                    labelText.text = String(format: "%d week",week  as CVarArg)
                                } else {
                                    labelText.text = String(format: "%d weeks",week  as CVarArg)
                                }
                            }
                            else if rem == 1 {
                                if week <= 1 {
                                    labelText.text = String(format: "%d week %d day ago",week,rem  as CVarArg)
                                } else {
                                    labelText.text = String(format: "%d weeks %d day ago",week,rem  as CVarArg)
                                }
                            } else {
                                labelText.text = String(format: "%d weeks %d days ago",week,rem  as CVarArg)
                            }
                        }
                        
                    }
                    
                } else {
                    if hours == 0 {
                        labelText.text = String(format: "%d days",days as CVarArg)
                    }
                    if hours == 1 {
                        labelText.text = String(format: "%d days %d hr ago",days,hours  as CVarArg)
                    }else{
                        if hours < 24 {
                            if hours == 0 {
                                labelText.text = String(format: "%d days",days  as CVarArg)
                            }
                            else if hours == 1 {
                                labelText.text = String(format: "%d days %d hr ago",days,hours  as CVarArg)
                            } else {
                                labelText.text = String(format: "%d days %d hrs ago",days,hours  as CVarArg)
                            }
                        } else {
                            if hours >= 24 {
                                let days = hours / 24
                                let rem = hours % 24
                                if rem == 0 {
                                    if days <= 1{
                                        labelText.text = String(format: "%d day",days  as CVarArg)
                                    }
                                    else{
                                        labelText.text = String(format: "%d days",days  as CVarArg)
                                    }
                                }
                                if rem == 1 {
                                    if days <= 1{
                                        labelText.text = String(format: "%d day %d hr ago",days,rem  as CVarArg)
                                    }
                                    else{
                                        labelText.text = String(format: "%d days %d hr ago",days,rem  as CVarArg)
                                    }
                                } else {
                                        labelText.text = String(format: "%d days %d hrs ago",days,rem  as CVarArg) }
                                 }
                        }
                    }
                }
            }
        }
    }
    
    static func convertMinAndHoursToUSerReadbleFormat (labelText:UILabel, ParkTime:String) {
        let paltime = NSInteger(ParkTime)
        let hours = 0
        let minutes = paltime
        let strJustNow:String = "Just now"

        if let pal = paltime, pal <= 59 {
            if minutes == 0 {
                labelText.text = strJustNow
            }
            else if minutes == 1{
                labelText.text  = String(format: "%d min",minutes  as! CVarArg)
            }
            else{
                labelText.text  = String(format: "%d mins",minutes  as! CVarArg)
            }
        } else {
            var hours = ((paltime ?? 0) / 60)
            let days = (hours / 24)
            let week = days/7
            let month = days / 30
            print("\(days)")
            let minutes = ((paltime ?? 0) % 60)
            print(hours)
            print(minutes)
            if days == 0 {
                if hours == 0 {
                    if minutes == 0 {
                        labelText.text = strJustNow
                    }
                     if minutes == 1 {
                        labelText.text = String(format: "%d hr %d min",hours,minutes  as CVarArg)
                    }else{
                        labelText.text = String(format: "%d hr %d mins",hours,minutes  as CVarArg)
                    }
                }
                else if hours == 1 {
                    if minutes == 0 {
                        labelText.text = String(format: "%d hr",hours  as CVarArg)
                    }
                    else if minutes == 1 {
                        labelText.text = String(format: "%d hr %d min",hours,minutes  as CVarArg)
                    }else{
                        labelText.text = String(format: "%d hr %d mins",hours,minutes  as CVarArg)
                    }
                }else{
                    if minutes == 0 {
                        labelText.text = String(format: "%d hrs",hours  as CVarArg)
                    }
                    else if minutes == 1 {
                        labelText.text = String(format: "%d hrs %d min",hours,minutes  as CVarArg)
                    }else{
                        labelText.text = String(format: "%d hrs %d mins",hours,minutes  as CVarArg)
                    }
                }
            }
            else if days == 1 {
                if hours == 0 {
                    labelText.text = String(format: "%d day",days as CVarArg)
                }
                else if hours == 1 {
                    labelText.text = String(format: "%d day %d hr",days,hours  as CVarArg)
                }else{
                    if hours > 24 {
                        if hours == 0 {
                            labelText.text = String(format: "%d day",days  as CVarArg)
                        }
                        if hours == 1 {
                            labelText.text = String(format: "%d day %d hr",days,hours  as CVarArg)
                        } else {
                            labelText.text = String(format: "%d day %d hrs",days,hours  as CVarArg)
                        }
                    }
                    if hours >= 24 {
                        let days = hours / 24
                        let rem = hours % 24
                        if rem == 0 {
                            labelText.text = String(format: "%d day",days  as CVarArg)
                        }
                        else if rem == 1 {
                            labelText.text = String(format: "%d day %d hr",days,rem  as CVarArg)
                        } else {
                        labelText.text = String(format: "%d day %d hrs",days,rem  as CVarArg)
                        }
                    }
                }
            }
            else if week == 1 {
                if days == 0 {
                    labelText.text = String(format: "%d week",week  as CVarArg)
                }
                else if days == 1 {
                    labelText.text = String(format: "%d week %d day",week,days  as CVarArg)
                }else{
                    if days > 7 {
                        if days == 0 {
                            labelText.text = String(format: "%d week",week  as CVarArg)
                        }
                        else if days == 1 {
                            labelText.text = String(format: "%d week %d day",week,days  as CVarArg)
                        } else {
                            labelText.text = String(format: "%d week %d days",week,days  as CVarArg)
                        }
                    }
                    if days >= 7 {
                        let week = days/7
                        let rem = days % 7
                        if rem == 0 {
                            labelText.text = String(format: "%d week",week  as CVarArg)
                        }
                        else if rem == 1 {
                            labelText.text = String(format: "%d week %d day",week,rem  as CVarArg)
                        } else {
                            labelText.text = String(format: "%d week",week  as CVarArg)
                            }
                    }
                }
            }
            else {
                if week > 1 {
                    if days == 0 {
                        labelText.text = String(format: "%d week",week  as CVarArg)
                    }
                    else if days == 1 {
                        labelText.text = String(format: "%d week %d day",week,days  as CVarArg)
                    } else {
                        if days < 7 {
                            if days == 0 {
                                labelText.text = String(format: "%d week",week  as CVarArg)
                            }
                            if days == 1 {
                                labelText.text = String(format: "%d week %d day",week,days  as CVarArg)
                            } else {
                                labelText.text = String(format: "%d week %d days",week,days  as CVarArg)
                            }
                        }
                        if days >= 7 {
                            let week = days/7
                            let rem = days % 7
                            if rem == 0 {
                                if week <= 1 {
                                    labelText.text = String(format: "%d week",week  as CVarArg)
                                } else {
                                    labelText.text = String(format: "%d weeks",week  as CVarArg)
                                }
                            }
                            else if rem == 1 {
                                if week <= 1 {
                                    labelText.text = String(format: "%d week %d day",week,rem  as CVarArg)
                                } else {
                                labelText.text = String(format: "%d weeks %d day",week,rem  as CVarArg)
                                }
                            } else {
                                labelText.text = String(format: "%d weeks %d days",week,rem  as CVarArg)
                            }
                        }
                    }
                } else {
                if hours == 0 {
                   labelText.text = String(format: "%d days",days  as CVarArg)
                }
                else if hours == 1 {
                    labelText.text = String(format: "%d days %d hr",days,hours  as CVarArg)
                }else{
                    if hours < 24 {
                        if hours == 0 {
                            labelText.text = String(format: "%d days",days  as CVarArg)
                        }
                        if hours == 1 {
                            labelText.text = String(format: "%d days %d hr",days,hours  as CVarArg)
                        } else {
                            labelText.text = String(format: "%d days %d hrs",days,hours  as CVarArg)
                        }
                    } else {
                        if hours >= 24 {
                            let days = hours / 24
                            let rem = hours % 24
                            if rem == 0 {
                                if days <= 1{
                                    labelText.text = String(format: "%d day",days  as CVarArg)
                                }
                                else{
                                    labelText.text = String(format: "%d days",days  as CVarArg)
                                }
                            }
                            else if rem == 1 {
                                if days <= 1{
                                     labelText.text = String(format: "%d day %d hr",days,rem  as CVarArg)
                                }
                                else{
                                    labelText.text = String(format: "%d days %d hr",days,rem  as CVarArg)
                                }
                            } else {
                                labelText.text = String(format: "%d days %d hrs",days,rem  as CVarArg)
                            }                        }
                    }
                }
            }
            }
        }
    }
  static  func Emptydata(){
        ticketnumber = nil
        stepticketnum1 = nil
        claimtypeeisId  = nil
        checkfrontbumper = false
        checkLeftFrontDoor = false
        checkLeftFrontQuarterPanel = false
        checkLeftRearDoor = false
        checkLeftRearQuarterPanel = false
        checkRearBumper = false
        checkRearviewMirror = false
        checkRightFrontDoor = false
        checkRightFrontQuarterPanel = false
        checkRightRearDoor = false
        checkRightRearQuarterPanel = false
        checkSideMirror = false
        checkTireRim = false
        checkWindow = false
        checkWindShield = false
        customername_m = nil
        address1_m = nil
        address2_m = nil
        cliamcity_m = nil
        claimstat_m = nil
        claimzip_m = nil
        claimphnum_m = nil
        email_m = nil
        claimyear_m = nil
        vinnumber_m = nil
        licplatenum_m = nil
        colourmodel_m = nil
        claimdesc_m = nil
        otherdetails_m = false
        otherdetails1_m = false
        otherdetails2_m = false
        otherdetails3_m = false
        otherdetails4_m = false
        otherdetails5_m = false
        otherdetails6_m = false
        otherdetails7_m = false
        incidentDateClaim = nil
        incidentDateeClaim = nil
        submittedDateClaim = nil
        checkvehicleturnedon = false
        checkticketmarked = false
        checktickedmarked = false
        checkleaving = false
        checkpolicereport = false
        checkclaimresident = false
        checkhotelguest = false
        ticketnumber = nil
        strScreenForCancel = ""
        year = nil
        liscence = nil
        vin = nil
        UserDefaults.standard.set(nil, forKey: "savecarmodel")
        UserDefaults.standard.set(nil, forKey: "savecarmake")
        UserDefaults.standard.set(nil, forKey: "savecarcolour")
    }
}


