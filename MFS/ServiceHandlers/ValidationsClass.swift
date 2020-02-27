//
//  ValidationsClass.swift
//
//  Created by Mouritech on 22/11/18.
//  Copyright © 2018 Mouritech. All rights reserved.
//

import UIKit

class ValidationsClass: NSObject {
    
   class func setAtributedStringForSortingButtons(withString:String, isSelected:Bool) -> NSMutableAttributedString{
        let myMutableString =  NSMutableAttributedString.init(string: withString)
    myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value:FontsAndColors.LABEL_TEXT_COLOR, range: NSRange(location:0,length:withString.count-2))
    
    
        if(isSelected){
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value:FontsAndColors.LABEL_TEXT_COLOR, range: NSRange(location:withString.count-1,length:1))
        }else{
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: NSRange(location:withString.count-1,length:1))
        }
        
        return myMutableString
    }
    
    
class func textFeildMoveUPWithRespect(withSuperView : UIView, scrollView : UIScrollView, withTextFeild : UITextField ){
    
    let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 240, right: 0.0)
    if((withTextFeild.superview?.frame.origin.y)! + withTextFeild.frame.size.height + withTextFeild.frame.origin.y > withSuperView.frame.size.height - 240){
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        var aRect: CGRect = withSuperView.frame
        aRect.size.height -= 240
    if !aRect.contains(withTextFeild.frame.origin) {
   
    scrollView.scrollRectToVisible(withTextFeild.frame, animated: true)
    }
    }

    }
    
    
class func textViewMoveUPWithRespect(withSuperView : UIView, scrollView : UIScrollView, withTextView : UITextView ){
    let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 300, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        var aRect: CGRect = withSuperView.frame
        aRect.size.height -= 300
        if !aRect.contains(withTextView.frame.origin) {
            scrollView.scrollRectToVisible(withTextView.frame, animated: true)
        }
        
    }
    
    
    //MARK:- GET IP ADDRESS
    class func getIPAddress() -> String? {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                let interface = ptr?.pointee
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
            if let name: String = String(cString: (interface?.ifa_name)!), name == "en0" {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        return address
    }
    
    //MARK:- EMAIL VALIDATION
    static func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    //check null and nil validation in dictionary
    static func ckeckNullvalidation(dictionray:NSDictionary , key:String) -> String {
        if(dictionray.object(forKey: key) != nil && !(dictionray.object(forKey: key) is NSNull)){
            return  (dictionray.object(forKey: key) is String) ? dictionray.object(forKey: key) as! String :( (dictionray.object(forKey: key) is Int) ? String(dictionray.object(forKey: key) as! Int) : "")
        }
        
        return ""
    }
    static func ckeckNullvalidation(dictionray:NSArray , key:String) -> String {
        if (!(dictionray.value(forKey: key) is NSNull)){
            return  (dictionray.value(forKey: key) is String) ? dictionray.value(forKey: key) as! String :( (dictionray.value(forKey: key) is Int) ? String(dictionray.value(forKey: key) as! Int) : "")
        }
        
        return ""
    }
    
//    // Remove null values in dictionary
    static func nullValueReplaceWithEmptyStringInDict(withDict:NSDictionary) -> NSDictionary {
        
        let dict = NSMutableDictionary.init(dictionary: withDict);
        let keysToRemove = dict.allKeys.filter { dict[$0] is NSNull }
        for key in keysToRemove {
            dict.setValue("", forKey: key as! String)
        }
        return dict as NSDictionary
    }

    
    //MARK:- MAKE APPLOGOUT
    
class func makeAppLogout(){
//let customNavigation = FontsAndColors.STORY_BOARD.instantiateViewController(withIdentifier: "CustomNavigationController") as! CustomNavigationController;
//UIApplication.shared.delegate?.window??.rootViewController  = customNavigation;
//UserDefaults.standard.removeObject(forKey: "UserLogin_Details")
//UserDefaults.standard.synchronize()
//print(UserLoginResponseDetails.destroy());
    }
    
    
    //MARK:- TimeZone Conversion
    
    /// with returns zone

    static func convertdateFomateWithReturnTimeZone(withDate:String,withFormate:String) -> String {
        if(withDate != ""){
            let dateFormatter = DateFormatter()
            dateFormatter.locale =  Locale(identifier:"en_US_POSIX") as Locale?
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone(abbreviation: "PST")
            let date = dateFormatter.date(from: withDate)
          //  dateFormatter.timeZone = TimeZone.init(identifier: ValidationsClass.getAccountTimeZone())
            
            print("before change time::  %@",withDate)
            print("after change time::  %@",dateFormatter.string(from: date!))
            dateFormatter.dateFormat = withFormate
            print("timezone formate ::::::%@", dateFormatter.string(from: date!))
            
            var retunDate : String =  dateFormatter.string(from: date!)
            
            //// ****** check device fromate
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            let dateString: String = formatter.string(from: date!)
            let amRange: NSRange? = (dateString as NSString).range(of: formatter.amSymbol)
            let pmRange: NSRange? = (dateString as NSString).range(of: formatter.pmSymbol)
            let is24h: Bool = amRange?.location == NSNotFound && pmRange?.location == NSNotFound
            print("""
                \(is24h ? "YES" : "NO")
                
                """)
            if is24h {
                let twelveHourLocale: NSLocale? = NSLocale(localeIdentifier: "en_US_POSIX")
                if let aLocale = twelveHourLocale {
                    formatter.locale = aLocale as Locale
                }
                formatter.dateFormat = withFormate
                retunDate = formatter.string(from: date!)
            }
            return retunDate;
            
        }else{
            return ""
        }
    }
   
   
static func convertdateFomateWith(withDate:String,withFormate:String) -> String {
    if(withDate != ""){
    let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier:"en_US_POSIX") as Locale?
    dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = withFormate   //"MMM dd,yyyy"
    let date: Date = dateFormatterGet.date(from: self.converttoUserTimeZone(actualTime: withDate))!
        var retunDate : String =  dateFormatter.string(from: date)
   
        //// ****** check device fromate
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale.current
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        let dateString: String = formatter.string(from: date)
        let amRange: NSRange? = (dateString as NSString).range(of: formatter.amSymbol)
        let pmRange: NSRange? = (dateString as NSString).range(of: formatter.pmSymbol)
        let is24h: Bool = amRange?.location == NSNotFound && pmRange?.location == NSNotFound
        print("""
            \(is24h ? "YES" : "NO")
            
            """)
        if is24h {
            let twelveHourLocale: NSLocale? = NSLocale(localeIdentifier: "en_US_POSIX")
            if let aLocale = twelveHourLocale {
                formatter.locale = aLocale as Locale
            }
            formatter.dateFormat = withFormate
            retunDate = formatter.string(from: date)
        }
        return retunDate;
        
    }else{
        return ""
    }
    }
    
static func convertdateFomateForChatList(withDate:String) -> String {
    if(withDate != ""){
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier:"en_US_POSIX") as Locale?
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let toDaydate = dateFormatterGet.date(from: ValidationsClass.localToAccountTimeZone(date: ""))!
    let actualDate : Date = dateFormatterGet.date(from: self.converttoUserTimeZone(actualTime: withDate))!
   
    let calendar = NSCalendar.current
    let date1 = calendar.startOfDay(for: actualDate)
    let date2 = calendar.startOfDay(for: toDaydate)
    let components = calendar.dateComponents([.day], from: date1, to: date2)
    print("Time interval:",components)
    
    if components.day == 0 {
      dateFormatter.dateFormat = "h:mm a"
    }else if(components.day == 1){
       dateFormatter.dateFormat = "MMM dd, yyyy h:mm a"
    }else{
    dateFormatter.dateFormat = "MMM dd, yyyy h:mm a"
    }//"MMM dd,yyyy"
    let date: Date = dateFormatterGet.date(from: self.converttoUserTimeZone(actualTime: withDate))!
   
    return (components.day == 1) ? "Yesterday" :dateFormatter.string(from: date)
    }else{
        return ""
    }
    }
    
    static func setDateFormateToSendServcie(withdateString:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let newDate = dateFormatter.date(from: withdateString)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: newDate!)
    }
    
    

    static func setDateFormateToCalender(withdateString:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let newDate = dateFormatter.date(from: withdateString)
        return newDate!
    }
    
    static func getToDayDateToSetInitialsToTextFeild()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return ValidationsClass.getUserDeviceTimeZoneAndConvertToAccountTimeZone()
    }
    static func getTwoMonthsBackDayDateToSetInitialsToTextFeild()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
        dateFormatter.dateFormat = "MM-dd-yyyy"
        var dayComponent = DateComponents()
        let theCalendar = Calendar.current
        dayComponent.month = -2
      let nextDate = theCalendar.date(byAdding: dayComponent, to: Date())!
        let newDate = dateFormatter.string(from: nextDate)
        return newDate
    }
    
    // Date Conversation Based on login time zone
   static func converttoUserTimeZone(actualTime: String) -> String {
 
    if(UserDefaults.standard.object(forKey: "UserLogin_Details") != nil){

        let dateFormatter = DateFormatter()
        dateFormatter.locale =  Locale(identifier:"en_US_POSIX") as Locale?
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "PST")
        let date = dateFormatter.date(from: actualTime)
        //dateFormatter.timeZone = TimeZone.init(identifier: ValidationsClass.getAccountTimeZone())
       
        print("before change time::  %@",actualTime)
        print("after change time::  %@",dateFormatter.string(from: date!))
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        print("date % with timezone %@",dateFormatter.string(from: date!))

        return dateFormatter.string(from: date!)
        
    }else{
     return ""
    }
    }
    //MARK:- GET USER TIME ZONE And Convert TO Account Toime Zone
static func getUserDeviceTimeZoneAndConvertToAccountTimeZone()-> String{
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = Date()
   // dateFormatter.timeZone = TimeZone.init(identifier: ValidationsClass.getAccountTimeZone())
     dateFormatter.dateFormat = "MM-dd-yyyy"
    return dateFormatter.string(from: date)

    }
    
//MARK:- GET USER TIME ZONE AND CONVER TO ACCOUNT TIME ZONE
static func getUserTimeZoneAndConvertToPSTTimeZone(withTime:String)-> String{
   
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = dateFormatter.date(from: withTime)
    dateFormatter.timeZone = TimeZone.init(abbreviation: "PST")
   return dateFormatter.string(from: date!)
    
    }
    
    //MARK:- GET USER TIME ZONE
//    static func getAccountTimeZone()-> String{
//    if(UserDefaults.standard.object(forKey: "UserLogin_Details") != nil){
//        let userDetails = UserDefaults.standard.object(forKey: "UserLogin_Details") as! NSDictionary
//        let userLoginDetails =  UserLoginResponseDetails.init(userDetils: userDetails)
//        return userLoginDetails.timezone;
//    }
//    return ""
//    }
    
    
   static func nullValueReplaceWithEmptyStringInDict(_ dictionaryResponse: NSDictionary) -> NSDictionary {
    let mutableDict: NSMutableDictionary = NSMutableDictionary.init(dictionary: dictionaryResponse);
        for key in mutableDict.allKeys {
            let value = mutableDict[key]
            if (value is NSDictionary) {
                mutableDict[key] = nullValueReplaceWithEmptyStringInDict((value as? NSDictionary)!)
            }
            else if (value is NSArray) {
                let newArray: NSMutableArray = NSMutableArray.init(array: value as! NSArray)
                for i in 0..<(value as! NSArray).count {
                    let value2 = (value as! [Any])[i]
                    if (value2 is NSDictionary) {
        
                        newArray[i] = nullValueReplaceWithEmptyStringInDict(value2 as! NSDictionary);
                    }
                    else if (value2 is NSNull) {
                        newArray[i] = ""
                    }
                }
                mutableDict[key] = newArray
            }
            else if (value is NSNull) {
                mutableDict[key] = ""
            }
        }
        return mutableDict as NSDictionary
    }
    
    
   static func localToAccountTimeZone(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        let dt = Date.init()
      //  dateFormatter.timeZone = TimeZone.init(identifier: ValidationsClass.getAccountTimeZone())
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
    return dateFormatter.string(from: dt)
    }
    
    
    static func getArrayOfTimeListDropDown(WithDateString:String) ->[String]{

        let sourceDateFormatter = DateFormatter()
        sourceDateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
        sourceDateFormatter.timeZone = TimeZone.current
        sourceDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
       let  date = sourceDateFormatter.date(from: ValidationsClass.localToAccountTimeZone(date: ""))!
    
        print("selected date %@",WithDateString)
        print("Device date after %@",date)
        
        // selected date
        let dateFormatter = DateFormatter.init()
        dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let selectedDate = dateFormatter.date(from: WithDateString)
        print(selectedDate!)
        
        let calendar = Calendar.current
        var hour = calendar.component(.hour, from: date)
        var minutes = calendar.component(.minute, from: date)
        var startTime = "";
        if(selectedDate! > date){
            startTime = "12:00 AM"
           
        }else{
            
            print(hour,minutes)
            switch minutes {
            case 0 ... 14:
                minutes = 15
                print("success")
            case 14 ... 29:
                minutes = 30
                print("success")
            case 30 ... 44:
                minutes = 45
                print("success")
            case 45 ... 59:
                minutes = 00
                
                ////****** for last 1 hour for current date
                if(hour == 23){
                    return [];
                }
                 ////****** for last 1 hour for current date
                
                if(hour != 23){
                    hour = hour+1
                }
               
            default:
                print("failure")
            }
            startTime = String(hour)+":"+String(minutes)
            startTime = ValidationsClass.timeConvetion24HoursTo12HourFormMat(withTime:String(startTime))
        }
        var displayTimeListArray  = [String]()
        print("start time : %@",startTime)
        let endTime = "11:45 PM"
        let timeFormat = DateFormatter()
        timeFormat.locale = Locale(identifier:"en_US_POSIX") as Locale?
        timeFormat.dateFormat = "h:mm a"
        var fromTime: Date? = timeFormat.date(from: startTime)
        let toTime: Date? = timeFormat.date(from: endTime)
        
        // add stating time
        displayTimeListArray.append(timeFormat.string(from: fromTime!))
        
        var dateByAddingThirtyMinute: Date?
        let timeinterval: TimeInterval? = toTime?.timeIntervalSince(fromTime!)
        print("time Int \(timeinterval! / 3600)")
        let numberOfIntervals = Float((timeinterval! / 3600))
        print("Start time \(numberOfIntervals)")
        for _ in 0..<Int(numberOfIntervals*4) {
            dateByAddingThirtyMinute = fromTime?.addingTimeInterval(900)
            fromTime = dateByAddingThirtyMinute
            var formattedDateString = ""
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
            dateFormatter.dateFormat = "h:mm a"
            if let aMinute = dateByAddingThirtyMinute {
                formattedDateString = dateFormatter.string(from: aMinute)
            }
            displayTimeListArray.append(formattedDateString)
        }
        
        print(displayTimeListArray)
        
        return displayTimeListArray;
    }
    
    static func timeConvetion24HoursTo12HourFormMat(withTime:String)->String{
        if(withTime != ""){
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
            dateFormatter.dateFormat = "HH:mm"
            let date = dateFormatter.date(from: withTime)
            dateFormatter.dateFormat = "h:mm a"
            let Date12 = dateFormatter.string(from: date!)
            return Date12
        }else{
            return ""
        }
    }
    
    //MARK:- EMOJI ENCODING AND DECODING
    
    
     class func encodingEmojiandText(_ encodeStr: String?) -> String? {
        if let encodeStr = NSString(cString: (encodeStr?.cString(using: .nonLossyASCII)!)!, encoding: String.Encoding.utf8.rawValue){
            return encodeStr as String
        }
        return ""
    }
    
   class func decodingEmojiandText(_ DecodeStr: String?) -> String? {
    
//    let data = DecodeStr?.data(using: String.Encoding.utf8, allowLossyConversion: false)
//    var comentarios = "";
//
//    if data != nil{
//        let valueunicode = NSString(data: data!, encoding: String.Encoding.nonLossyASCII.rawValue) as String?
//
//        if valueunicode != nil{
//            comentarios = valueunicode!
//        }
//    }
//
//    return comentarios;
//    }
    
    
        let data = DecodeStr?.data(using: String.Encoding.utf8);
        let decodedStr = NSString(data: data!, encoding: String.Encoding.nonLossyASCII.rawValue)
        if let str = decodedStr{
            return str as String
        }
        return DecodeStr
    }
    
}

enum DateRoundingType {
    case round
    case ceil
    case floor
}

extension Date {
    func rounded(minutes: TimeInterval, rounding: DateRoundingType = .round) -> Date {
        return rounded(seconds: minutes * 60, rounding: rounding)
    }
    func rounded(seconds: TimeInterval, rounding: DateRoundingType = .round) -> Date {
        var roundedInterval: TimeInterval = 0
        switch rounding  {
        case .round:
            roundedInterval = (timeIntervalSinceReferenceDate / seconds).rounded() * seconds
        case .ceil:
            roundedInterval = ceil(timeIntervalSinceReferenceDate / seconds) * seconds
        case .floor:
            roundedInterval = floor(timeIntervalSinceReferenceDate / seconds) * seconds
        }
        return Date(timeIntervalSinceReferenceDate: roundedInterval)
    }
}
