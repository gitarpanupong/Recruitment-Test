//
//  Service.swift
//  RecruitmentTestDemoApp
//
//  Created by Panupong Chaiyarut on 19/1/2565 BE.
//

import Alamofire
import ObjectMapper

class HomeService {
    static let sharedInstance = HomeService()
    
    func getFun(_ type: String,parameter: Parameters,method: HTTPMethod = .get,header: HTTPHeaders? = nil, completion: @escaping(FunModel?) -> Void ){
        API.sharedInstance.request(url: "https://storage.googleapis.com/finno-ex-re-v2-static-staging/recruitment-test/fund-ranking-\(type).json", method: method) { response in
            
            guard response != nil else {
                return
            }
            
            let data = Mapper<FunModel>().map(JSON: response?.value as! [String : Any])
            completion(data!)
        }
        
    }
    
    
}
