//
//  FontsAndColors.swift
//  Notifii Connect Managers App
//
//  Created by DevRabbit on 15/11/17.
//  Copyright © 2017 DevRabbit. All rights reserved.
//

import UIKit

class FontsAndColors: NSObject {
    static let LOGO_IMAGE = UIImage.init(named:"logo.png")
  
    static let STORY_BOARD = UIStoryboard.init(name: "Main", bundle: nil)
    
    // MARK:- DEVICE CHACKING
    static let SCREEN_MAX_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_MAX_HEIGHT = UIScreen.main.bounds.size.height
    static let ISIPHONE = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone)
     static let ISIPAD = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
    static let SCREEN_MAX_LENGTH = max(SCREEN_MAX_WIDTH,SCREEN_MAX_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(SCREEN_MAX_WIDTH,SCREEN_MAX_HEIGHT)
    
    static let ISPHONE_5 = (ISIPHONE && (SCREEN_MAX_LENGTH) == 568)
    static let ISPHONE_6 = (ISIPHONE && (SCREEN_MAX_LENGTH) == 667.0)
    static let ISPHONE_6P = (ISIPHONE && (SCREEN_MAX_LENGTH) == 736.0)
    static let ISPHONE_X = (ISIPHONE && (SCREEN_MAX_LENGTH) == 812.0)
    static let HEADER_VIEW_HEIGHT = (ISPHONE_X ?84:64)
    
    static let TABBAR_HEIGHT = (ISIPAD ? 80 :(ISPHONE_5 ?49:(ISPHONE_X ?80:55)))
   
    //MARK:- FONT NAMES
 
//    static let HEAVY_FONT = ISIPHONE ? "Avenir-Heavy" : "Avenir Next Demi Bold"
//    static let MEDIUM_FONT = ISIPHONE ? "Avenir-Medium" : "Avenir Next Medium"
//    static let ROMAN_FONT = ISIPHONE ? "Avenir-Roman" : "Avenir Next Medium"
    
    static let HEAVY_FONT = "OpenSans-Heavy"
    static let MEDIUM_FONT = "OpenSans-Medium"
    static let ROMAN_FONT = "OpenSans-Regular"
    static let MONTSERRAT_LIGHTITALIC_FONT = "OpenSans-LightItalic"
    static let MONTSERRAT_BOLDITALIC_FONT = "OpenSans-BoldItalic"
    static let MONTSERRAT_LIGHT_FONT = "OpenSans-Light"
    static let MONTSERRAT_THINITALIC_FONT = "OpenSans-ThinItalic"
    static let MONTSERRAT_EXTRALIGHT_FONT = "OpenSans-ExtraLight"
    static let MONTSERRAT_THIN_FONT = "OpenSans-Thin"
    static let MONTSERRAT_BOLD_FONT = "OpenSans-Bold"
    static let MONTSERRAT_MEDIUM_ITALIC = "OpenSans-MediumItalic"
    static let MONTSERRAT_BLACK_ITALIC = "OpenSans-BlackItalic"
    static let MONTSERRAT_SEMI_BOLD = "OpenSans-SemiBold"
    static let MONTSERRAT_EXTRA_LIGHT_ITALIC = "OpenSans-ExtraLightItalic"
    static let MONTSERRAT_EXTRA_BOLD = "OpenSans-ExtraBold"
    static let MONTSERRAT_BLACK = "OpenSans-Black"
    static let MONTSERRAT_REGULAR = "OpenSans-Regular"
    static let MONTSERRAT_ITALIC = "OpenSans-Italic"
    static let MONTSERRAT_SEMI_BOLD_ITALIC = "OpenSans-SemiBoldItalic"
    static let MONTSERRAT_EXTRA_BOLD_ITALIC = "OpenSans-ExtraBoldItalic"









    //MARK:- LogInViewController
    
    static let LOGIN_LABEL_FONT = UIFont.init(name: MONTSERRAT_EXTRA_BOLD_ITALIC, size: 20)
    static let BORDER_COLOR = UIColor.lightGray
    static let Red_COLOR = UIColor.red
    static let Gates_DROPDOWN_BORDER_COLOR = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0);
    static let GREEN_VALIDATION_COLOR = UIColor.init(red: 152/255.0, green: 198/255.0, blue: 68/255.0, alpha: 1.0);
    static let APP_STATUSBAR_COLOR = UIColor.init(red: 12.0/255.0, green: 88.0/255.0, blue: 142.0/255.0, alpha: 1.0);

    static let RETRIVAL_REQUESTS_BORDER_COLOR  = UIColor.init(red: 0.0/255.0, green: 202.0/255.0, blue: 120.0/255.0, alpha: 1.0);
    
    static let TABBAR_BUTTON_FONT = UIFont.init(name: HEAVY_FONT, size: 18)
    
    static let SAVE_BUTTON_FONT = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ? (ISPHONE_5 ? 16:17):20))
    
    static let BACK_BUTTON_FONT = UIFont.init(name: ROMAN_FONT, size: (ISIPHONE ? 18:20))
    
    static let TEXTFEILD_FONT = UIFont.init(name: ROMAN_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 14:15):18))
    static let LABLE_FONT = UIFont.init(name: ROMAN_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 14:15):18))
    static let HEADER_VIEW_TITLE_FONT = UIFont.init(name: HEAVY_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 16:17):20))
    static let TABLEVIEW_VIEW_HEADER_LABLE_TITLE_FONT = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 15:16):20))
    
static let RESIDENTNAME_UNITNUMBER_TEXTFONT =  UIFont.init(name: HEAVY_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 15:16):20))
   
static let FORGOTPASS_BUTTON_FONT = UIFont.init(name: ROMAN_FONT, size: (ISPHONE_5 ? 14:16))
static let FORGOTPASS_LABEL_FONT = UIFont.init(name: ROMAN_FONT, size: (ISPHONE_5 ? 14:16))
    
static  let FORGOTPASS_NO_PASSWORD : UIFont = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 20:22):28))!;
   
    
    static  let CANCEL_YES_NO_MESSAGE_POPUP_FONT : UIFont = UIFont.init(name: ROMAN_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 16:18):23))!;
    
static let SORTING_BUTTON_TEXT_FONT  = UIFont.init(name: HEAVY_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 11.5:(ISPHONE_6 ? 12:13)):18))!;

    
    // MARK:- ACTIVITY INDICATOR BG COLOR
    static let ACTIVITY_INDICATOR_BG_COLOR  = UIColor.init(red: 34.0/255.0, green: 148.0/255.0, blue: 234.0/255.0, alpha: 1.0);
    
    
    //MARK:- BORDERCOLORS
    static let TEXTFIELD_BORDER_COLOR  = UIColor.init(red: 228.0/255.0, green: 228.0/255.0, blue: 228.0/255.0, alpha: 1.0);
    static let BUTTON_BORDER_COLOR  = UIColor.init(red: 77.0/255.0, green: 150.0/255.0, blue: 168.0/255.0, alpha: 1.0);
    
    
    //MARK:- BGCOLORS
    static let IMG_PLACEHOLDER_TEXT_LBL_BGCOLOR : UIColor = UIColor.init(red: 152.0/255.0, green: 167.0/255.0, blue: 199.0/255.0, alpha: 1.0);
   
    //MARK:- TEXTCOLORS
    //MARK:- HEADERVIEW && GLOBLE
     static let  HEADER_VIEW_TITLE_TEXT_COLOR : UIColor = UIColor.white
     static let HEADER_VIEW_BG_COLOR  = UIColor.init(red: 34.0/255.0, green: 148.0/255.0, blue: 234.0/255.0, alpha: 1.0);
      static let SAVE_BUTTON_BG_COLOR : UIColor = UIColor.init(red: 34.0/255.0, green: 148.0/255.0, blue: 234.0/255.0, alpha: 1.0);
     static let SAVE_BUTTON_TEXT_COLOR : UIColor = UIColor.white
    static let LABEL_TEXT_COLOR = UIColor.darkGray
   // static let LABEL_TEXT_COLOR = UIColor.red
    
    static let TEXTFEILD_TEXT_COLOR = UIColor.init(red: 60.0/255.0, green: 99.0/255.0, blue: 157.0/255.0, alpha: 1.0);
    
     static let TEXTFEILD_BACKGROUND_COLOR = UIColor.init(red: 246.0/255.0, green: 249.0/255.0, blue: 251.0/255.0, alpha: 1.0);
    static let FORGOTPASS_BUTTON_TEXT_COLOR = UIColor.lightGray
    static let FORGOTPASS_LABEL_TEXT_COLOR = UIColor.lightGray
    static let TABLEVIEW_HEADER_LABLE_TEXT_COLOR = UIColor.white
    static let TABLEVIEW_HEADER_LABLE_BG_COLOR = UIColor.lightGray
    static let IMG_PLACEHOLDER_LBL_TEXT_COLOR : UIColor = UIColor.white;

     static let RESIDENTNAME_UNITNUMBER_TEXTCOLOR  = UIColor.init(red: 5.0/255.0, green: 46.0/255.0, blue: 69.0/255.0, alpha: 1.0);
    
    
    //MARK:- EMAIL AND SHEDULE MESSAGES
    //font colors
     static let EMAI_SHEDULE_MESSAGE_SUBJECT_AND_DATE_LABEL_TEXT_COLOR : UIColor = UIColor.init(red: 34.0/255.0, green: 148.0/255.0, blue: 234.0/255.0, alpha: 1.0);
    static  let EMAI_SHEDULE_MESSAGE_SUBJECT_TEXT_COLOR : UIColor = UIColor.init(red: 77.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0);
    static  let EMAI_SHEDULE_MESSAGE_DETAILS_TEXT_COLOR : UIColor = UIColor.lightGray
   // static  let EMAI_SHEDULE_MESSAGE_DETAILS_TEXT_COLOR : UIColor = UIColor.init(red: 205.0/255.0, green: 205.0/255.0, blue: 205.0/255.0, alpha: 1.0);
     static  let EMAI_SHEDULE_MESSAGE_DETAILS_VALUE_TEXT_COLOR : UIColor = UIColor.init(red: 69.0/255.0, green: 104.0/255.0, blue: 163/255.0, alpha: 1.0);
     static let SEND_TEST_BUTTON_BG_COLOR  = UIColor.init(red: 49.0/255.0, green: 128.0/255.0, blue: 185.0/255.0, alpha: 1.0);
    
    //fonts
    static  let EMAI_SHEDULE_MESSAGE_SUBJECT_FONT : UIFont = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 19:20):24))!;
     static  let EMAI_SHEDULE_MESSAGE_DETAILS_FONT : UIFont = UIFont.init(name: ROMAN_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 15:16):20))!;
     static  let EMAI_SHEDULE_MESSAGE_SUBJECT_AND_DATE_LABEL_FONT : UIFont = UIFont.init(name: ROMAN_FONT, size:(ISIPHONE ?(ISPHONE_5 ? 15:16):20))!;
    
static  let EMAI_SHEDULE_MESSAGE_SELECTION_BUTTON_FONT : UIFont = UIFont.init(name: ROMAN_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 12:15):18))!;
    
    
    //MARK:- AddRESIDNET& RESIDENTPROFILE
    //fonts
    static let RESIDENTPROFILE_NAME_TEXT_COLOR : UIColor = UIColor.init(red: 58.0/255.0, green: 95.0/255.0, blue: 152.0/255.0, alpha: 1.0);
     static  let RESIDENTPROFILE_NAME_TEXT_FONT  : UIFont = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 21:22):26))!;

    static  let COMMUNITY_SERVICE_LABLE_FONT  : UIFont = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 12:13):15))!;
   
    
    //MARK:- MORE SCREEN
    //fonts
    static let NAME_LABEL_COLOR : UIColor = UIColor.black;
    static  let NAME_TEXT_FONT  : UIFont = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 23:24):28))!;
    static let APT_NAME_LABEL_COLOR : UIColor = UIColor.init(red: 172.0/255.0, green: 188.0/255.0, blue: 214.0/255.0, alpha: 1.0);
    static  let APT_NAME_TEXT_FONT  : UIFont = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 16:17):20))!;
    
    static let MORE_TABLEVIEW_LBL_COLOR : UIColor = UIColor.lightGray
    
   // static let MORE_TABLEVIEW_LBL_COLOR : UIColor = UIColor.init(red: 172.0/255.0, green: 188.0/255.0, blue: 214.0/255.0, alpha: 1.0);
    static  let MORE_TABLEVIEW_LBL_FONT  : UIFont = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 17:18):22))!;
    
       static let MYPROFILE_DETAIL_LABLE = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 15:16):20))
    
    static let ALERT_CANCEL_AND_OK_BUTTON_FONT = UIFont.init(name: ROMAN_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 15:16):20))
    
    
    //MARK:- CHAT SCREEN
    static  let CHAT_DETAILS_TEXT_FONT  : UIFont = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 16:17):18))!;
    static  let CHAT_DETAILS_INPUT_TYPEMESSAGE_FONT  : UIFont = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 17:18):22))!;
    static  let CHAT_SENDER_NAME_FONT  : UIFont = UIFont.init(name: MEDIUM_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 10:11):14))!;
    static  let CHAT_LIST_DATE_FONT  : UIFont = UIFont.init(name: ROMAN_FONT, size: (ISIPHONE ?(ISPHONE_5 ? 14:15):16))!;
    
}
