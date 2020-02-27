//
//  Constatns.swift
//  SampleSwiftNotifiiConnect
//
//  Created by DevRabbit on 17/02/17.
//  Copyright © 2017 DevRabbit. All rights reserved.
//

import UIKit

class Constatns: NSObject {
    
    //MARK: - Gcp BASE URL
    // static let BASE_URL = "http://35.237.1.93/vts/"
    
    //MARK: - Staging BASE URL
    //static let BASE_URL =  "https://vts2api-stage.citizensparking.com/vts/"
    // static let DashBoardurl = "http://35.237.1.93/vts/livedashboard/attendent/app/livedashboard?locationId="
    //MARK: - Staging DashBoardurl URL
    //    static let DashBoardurl = "https://vts2api-stage.citizensparking.com/vts/livedashboard/attendent/app/livedashboard?locationId="
    
    //    static let  COMPLEMENTORY_TICKETS_URL = "livedashboard/attendent/app/parkedTickets?locationId="
    static let  COMPLEMENTORY_TICKETS_URL = "dashboard/attendent/parked?standId="
    
    //http://35.237.1.93/vts/security/auth/login

    static let  LOGIN_URL = "security/auth/login";
    static let  LOG_OUT_URL = "location/endshift/"
    //http://35.237.1.93/vts/ticket/receiptDetailspdf
    static let  RECEIPT_DETAIL_URL = "ticket/receiptDetailspdf";
    static let  AUTO_LOG_OUT_URL = "security/auth/logout?userId=";
    
    // rahul chnages
    // static let  LOCATIONS_URL = "locationmanage/location/user";
    static let  LOCATIONS_URL = "location/user";
    
    
    // static let  GATES_URL = "locationmanage/stand/loc/";
    static let  GATES_URL = "location/stand/list/";
    
    // rahul chnages
    
    
    static let  SHIFT_START_URL = "location/startshift/"
    static let  LIVE_DASHBOARD_URL = "livedashboard/attendent/app/livedashboard?locationId="
    
    //    static let  ACTIVE_TICKETS_URL = "livedashboard/attendent/app/active?locationId="
    static let  ACTIVE_TICKETS_URL = "dashboard/attendent/active?standId="
    
    
    // static let  KEY_FOB_PENDING_URL = "livedashboard/attendent/app/keyfobpending?locationId="
    static let  KEY_FOB_PENDING_URL = "dashboard/attendent/keyfobpending?standId="
    
    // rahul chnages
    
    //    static let  PAID_TICKETS_URL = "livedashboard/attendent/app/paid?locationId="
    static let  PAID_TICKETS_URL = "dashboard/attendent/paid?standId="
    
    //    static let  QR_TICKETS_URL = "livedashboard/attendent/app/qrTickets?locationId="
    static let  QR_TICKETS_URL = "dashboard/attendent/qr?standId="
    
    // static let  SMS_TICKETS_URL = "livedashboard/attendent/app/smstickets?locationId="
    static let  SMS_TICKETS_URL = "dashboard/attendent/sms?standId="
    
    //   static let  UNPAID_TICKETS_URL = "livedashboard/endent/app/unpaid?locationId="
    static let  UNPAID_TICKETS_URL = "dashboard/attendent/unpaid?standId="
    
    // rahul chnages
    static let REFERSH_TOKEN_URL = "security/auth/token/refresh"
    

    
    //    static let  VALIDATIONS_TICKETS_URL = "livedashboard/attendent/app/validation?locationId="
    static let  VALIDATIONS_TICKETS_URL = "dashboard/attendent/validation?standId="
    
    //  static let  RETRIVAL_REQUESTS_TICKETS_URL = "ticketservice/ticket/"
    static let  RETRIVAL_REQUESTS_TICKETS_URL = "ticket/retrieve/"
    
    // static let  CUSTOMER_TICKET_URL = "ticketservice/customer/"
    static let  CUSTOMER_TICKET_URL = "ticket/customer/"
    
    //    static let  CAR_MAKES_URL = "ticketservice/vehcile/makes"
    static let  CAR_MAKES_URL = "ticket/vehicle/makes"
    
    //    static let  CAR_COLORS_URL = "ticketservice/vehcile/colors"
    static let  CAR_COLORS_URL = "ticket/vehicle/colors"
    
    //    static let  FETCH_DRIVERS_LIST_URL = "ticketservice/driver/"
    static let  FETCH_DRIVERS_LIST_URL = "ticket/driver/"
    
    //    static let  RETRIVE_TICKET_URL = "ticketservice/ticket/"
    static let  RETRIVE_TICKET_URL = "ticket/retrieve/"
    
    //    static let  VOID_URL = "ticketservice/void"
    static let  VOID_URL = "ticket/void"
    
    // static let  REPARK_REASONS_LIST_URL = "ticketservice/ticket/repark/reasons"
    static let  REPARK_REASONS_LIST_URL = "ticket/repark/reasons"
    
    static let  ASSIGN_DRIVER_URL = "ticket/driver/assign/"
    //http://35.237.1.93/vts/ticket/driver/assign/438790/09979A17-75F7-49C9-9349-1642CC1CB356
    
    static let  VALIDATE_TICKET_URL = "ticket/customer/validate"
    static let  VEHICLE_MODELS_URL = "ticket/vehicle/models/"
    static let  REPARK_URL = "ticket/repark/"
    static let  CREATE_TICKET_URL = "ticket/create"
    static let  VOIDPOP_TICKET_URL = "ticket/void"
    static let  REPARKPOP_TICKET_URL = "ticket/repark/"
    static let  KEYFOB_ASSOCIATION_URL = "livedashboard/attendent/app/kefobAssociation"
    
    //    static let  KEYFOBDETAILS_PARK_URL = "livedashboard/attendent/app/keyfobdetails?ticketNumber="
    static let  KEYFOBDETAILS_PARK_URL = "ticket/attendent/keyfobdetails?ticketNumber="
    static let  ACTIVE_CAR_DETAILS_URL = "ticket/activecarsdetails/"
    
    
    static let  UPDATE_NOTIFICATION_TO_DB_URL = "parkassistant/parkingassistant/update/Notification?notificationId="
    
    static let  KEYFOB_ASSOCIATION_VALIDATION_URL = "ticket/attendent/validate/kefob"
    
    static let  PARKING_LOT_VALIDATION_URL = "ticket/attendent/validate/parkinglot"
    
    static let VALIDATION_DETAILS_API_URL = "ticket/validationticketdetails/"
    
    static let NEWRETRIVALREQUESTSCREEN_API_URL = "dashboard/attendent/retrievals?standId="
    
    // rahul chnages
    
    static let  PAIDORUNAPAIDDETAILS_ASSOCIATION_URL = "ticket/paidorunpaidcarsdetails/"
    
    static let  VIEWPEDDETAILS_URL = "ticket/viewpeddetails/"
    
    //     static let  SEARCHTIKCETDETAILS_URL =
    //    "livedashboard/attendant/search/details?ticketNumber="
    
    static let  SEARCHTIKCETDETAILS_URL =
    "dashboard/attendant/search/ticket?ticketNumber="
    
    
    //    static let CLAIMMANEGEMT_CLAIMS_URL = "claimmanage/claimManagement/claims/"
    static let CLAIMMANEGEMT_CLAIMS_URL = "claim/location/"
    // rahul chnages
    
    
    static let CLAIMMANAGEMENT_CLAIMID_URL = "claim/"
    static let CLAIMMANGMENTNEW_URL = "claim/new"
    static let CLAIMDETAILS_URL = "claim/claimDetails"
    
    //    static let PRICE_CATEGORIES_URL = "ticket/payment/pricecatagories/"
    static let PRICE_CATEGORIES_URL = "ticket/parkingCharges/pricecatagories/"
    ///parkingCharges/pricecatagories/8a54072469e91a330169e92093ec000a
    //http://35.237.1.93/vts/ticket/parkingCharges/pricecatagories/8a54072469e91a330169e92093ec000a
    //https://vts2api-stage.citizensparking.com/vts/ticket/customer/premessgaes

    //static let PRE_DEFINED_MESSAGES_URL = "ticketservice/customer/premessgaes"
    static let PRE_DEFINED_MESSAGES_URL = "ticket/customer/premessgaes"

    //    static let PARKING_CHARGES_URL = "ticketservice/payment/parkingCharges/"
    static let PARKING_CHARGES_URL = "ticket/parkingCharges/checkIn"
    
    static let TIP_URL = "ticket/parkingCharges/tipamount"
    
    //    static let CASH_PAYMENT_URL = "ticketservice/payment/cashPayment/"
    static let CASH_PAYMENT_URL = "ticket/parkingCharges/cashPayment"
    //http://35.237.1.93/vts/ticket/parkingCharges/cashPayment

    static let CARD_PAYMENT_URL = "billing/credit/purchase"
    static let CARD_PAYMENT_UPDATE_URL = "billing/transaction/update"
    static let SLED_PAYMENT_FAILURE_URL = "billing/transaction/failure/log"
    
    
    static let CLAIMINCIDENTLIST_URL = "claim/incident/"
    
    static let GET_CLAIM_PED_IMAGES = "claim/attachment/"
    
    static let CHECKOUT_CAR_URL = "ticket/checkout/"
    
    static let MERCHANTID_URL = "billing/authkey/"

    //    static let PARKINGCHARGES_CAR_URL = "ticketservice/payment/parkingCharges/checkout"
    static let PARKINGCHARGES_CAR_URL = "ticket/parkingCharges/checkout"
    
    //https://vtsapi-dev.reefparking.com/vts/ticket/parkingCharges/coupon/VTS0ABET
   // static let couponCode_URL = "ticket/parkingCharges/coupon/"
    static let couponCode_URL = "validation/coupon/validateCoupon/couponType?couponType="
    

//https://vtsapi-stage.reefparking.com/vts/validation/coupon/validateCoupon/coupon
   // static let couponCode_URL = "validation/coupon/validateCoupon/couponCode?couponCode="
    static let SEARCHRESULTS_URL = "admin/search/attendent"
    //    static let SEARCHRESULTS_URL = "admin/search/"
    
    //    static let NOTIFICATIONS_LIST_URL = "parkassistant/parkingassistant/allNotifications?standId="
    static let NOTIFICATIONS_LIST_URL = "parkassistant/allNotifications?standId="
    
   // static let SEND_MESSAGE_TO_CUSTOMER_URL = "ticketservice/ticket/sendmessage/"
    static let SEND_MESSAGE_TO_CUSTOMER_URL = "ticket/sendmessage/"
    
    // rahul chnages
    
    static let REMOVE_PHYSICAL_TICKET_URL = "ticket/physicaldelink"
    
    
    //  static let LIVE_DASHBOARD_API_CALL = "livedashboard/attendent/app/livedashboard?locationId="
    static let LIVE_DASHBOARD_API_CALL = "dashboard/attendent/liveStream?standId="
    // rahul chnages
    
    //http://35.237.1.93/vts/claimmanage/claimManagement/claimDetails
    //+++++++++++++ALERT MESSAGE+++++++++++++++++
    static let  NO_NET_ALERT_MESSAGE = "Looks like there is no internet. Please try to login in a few minutes."
    static let  CARCHECKIN_ALERT_MESSAGE = "Car checked-in successfully."
    static let  SHIFT_START_MESSAGE = "Welcome! Your shift has now started."
    static let  RESPONSE_NIL_MESSAGE = "Sorry! Unable to get data right now. We are working on it. "
    static let  TICKET_NOT_FOUND_MESSAGE = "Ticket not found."
    static let  TICKET_NOT_VALID_MESSAGE = "Ticket number entered was not found. Please try again."
    static let  ENTER_CASH_ALERT_MESSAGE = "Please enter amount to be charged."
    static let  ENTER_PARKING_LOT_NUMBER_MESSAGE = "Key Fob association successful. Please enter parking lot number."
    static let  NO_RETRIVAL_REQUESTS_MESSAGE = "No pending retrieval requests!"
    static let  ENTER_VALID_AMOUNT_MESSAGE = "Please enter a valid amount."
    static let ENTER_VALID_TICKET_NUMBER = "Please enter a valid ticket number."
    static let ENTER_TICKET_NUMBER = "Please enter the ticket number."
    static let SELECT_CLAIM_TYPE = "Please select claim type."
    static let SELECT_DAMAGE_PARTS = "Please select damaged parts."
    static let ENTER_CUSTOMER_NAME = "Please enter customer name."
    static let ENTER_ADDRESS = "Please enter address."
    static let ENTER_CITY = "Please enter city."
    static let ENTER_VALID_CITY = "Please enter valid city."
    static let ENTER_STATE = "Please enter state."
    static let ENTER_VALID_STATE = "Please enter valid state."
    static let ENTER_ZIP = "Please enter zip."
    static let ENTER_VALID_ZIP = "Please enter valid zip."
    static let ENTER_PHONE_NUMBER = "Please enter phone number."
    static let ENTER_VALID_MOBILE_NUMBER = "Please enter valid phone number."
    static let ENTER_EMAIL = "Please enter email."
    static let ENTER_VALID_EMAIL = "Please enter valid email."
    static let ENTER_YEAR_OF_MANUFACTURING = "Please enter year of manufacturing."
    static let SELECT_CAR_MAKE = "Please select car make."
    static let SELECT_CAR_MODEL = "Please select car model."
    static let SELECT_CAR_COLOR = "Please select car color."
    static let SELECT_VIN = "Please enter VIN for car."
    static let SELECT_LIC_PLATE_NUMBER = "Please enter license plate number."
    static let ENTER_DESCRIPTION = "Please enter description."
    static let SELECT_OTHER_DETAILS = "Please select other details."
    static let FEATURE_UNDER_CONSTRUCTION = "This feature is under implementation. It will be available in the upcoming build."
    static let KEY_FOB_ASSOCIATION_SUCCESS_MESSAGE = "Successfully associated the Key Fob"
    static let ENTER_CVV = "Please enter cvv"
    static let ENTER_VALID_CVV = "Please enter valid cvv"
    static let ENTER_CARD_NUMBER = "Please enter card number"
    static let ENTER_VALID_CARD_NUMBER = "Please enter valid card number"
    static let ENTER_EXPIRY = "Please enter expiry date"
    static let ENTER_VALID_EXPIRY = "Please enter valid expiry date"
    static let ENTER_CARD_NAME = "Please enter card name"
    static let ENTER_VALID_CARD_NAME = "Please enter valid customer name"
    static let API_ERROR_MESSAGE = "Something went wrong. Please try again!"
    static let WEAK_INTERNET_MESSAGE =  "Looks like internet is weak. Please check the network connectivity to continue flawlessly."
    static let SMS_COMMUNICATION_MESSAGE = "Please check the box to receive SMS communications."
}


