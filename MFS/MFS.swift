//
//  MFS.swift
//  CitizensParking
//
//  Created by Mouriuser on 13/05/19.
//  Copyright © 2019 Citizens Parking. All rights reserved.
//

import Foundation

struct Configuration {
    lazy var environment: MFS = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            if configuration.range(of:"Staging") != nil {
                return MFS.Staging
            } else if configuration.range(of:"Development") != nil {
                return MFS.Development
            }
            else if configuration.range(of:"Production") != nil {
                return MFS.Production
            }
        }
        return MFS.Development
    }()
}

enum MFS: String {
    case Staging = "staging"
    case Production = "production"
    case Development = "development"
    
    var baseURL: String {
        switch self {
            //        case .Staging: return "https://vts2api-stage.citizensparking.com/vts/"
            //        case .Production: return "https://vts2api.citizensparking.com/vts/"
            //        case .Development: return "http://35.237.1.93/vts/"
            //vtsapi-dev.reefparking.com/vts
        case .Development: return  "https://vtsapi-dev.reefparking.com/vts/"
        case .Staging: return "https://vtsapi-stage.reefparking.com/vts/"
      //  case .Staging: return   "https://vtsapi.reefparking.com/vts/"
        case .Production: return "https://vtsapi.reefparking.com/vts/"
            
        }
    }
    
    var apiKey: String {
            switch self {
            case .Development: return "93dd0c4b-c8c5-49c9-9a56-aba01fa33314"
            case .Staging: return "ce1647e0-f28a-4163-b0c0-fbb33b430ea9"
            //case .Staging: return "fed14d35-d877-4eb7-b630-dd668ab56588"
            case .Production: return "fed14d35-d877-4eb7-b630-dd668ab56588"
        }
    }
    var appVersion: String {
        switch self {
        case .Development: return "v1"
        case .Staging: return "v1"
        case .Production: return "v1"
        }
    }
}


