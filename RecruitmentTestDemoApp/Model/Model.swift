//
//  Model.swift
//  RecruitmentTestDemoApp
//
//  Created by Panupong Chaiyarut on 19/1/2565 BE.
//

import Foundation
import ObjectMapper

struct FunModel: Mappable {
    var status: Bool?
    var error: String?
    var data: [Datum]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        error <- map["error"]
        data <- map["data"]
    }
}

// MARK: - Datum
struct Datum: Mappable {
    var mstarID, thailandFundCode: String?
    var navReturn, nav: Double?
    var navDate: String?
    var avgReturn: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        mstarID <- map["mstar_id"]
        thailandFundCode <- map["thailand_fund_code"]
        navReturn <- map["nav_return"]
        navDate <- map["nav_date"]
        nav <- map["nav"]
        avgReturn <- map["avg_return"]
    }
}
