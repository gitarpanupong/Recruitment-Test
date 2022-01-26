//
//  API.swift
//  RecruitmentTestDemoApp
//
//  Created by Panupong Chaiyarut on 19/1/2565 BE.
//

import Alamofire
import ObjectMapper

class API {
    static let sharedInstance = API()
    
    func request(url: String,parameter: Parameters = [:],method: HTTPMethod,header: HTTPHeaders? = nil,completion: @escaping (AFDataResponse<Any>?) -> Void) {
        
        AF.request(url, method: method, parameters: parameter, headers: header, requestModifier: { $0.timeoutInterval = 30 }).responseJSON { (response) in
            DispatchQueue.main.async {
                switch response.result{
                case .success(_):
                    completion(response)
                case.failure(_):
                    completion(nil)
                }
            }
        }
        
    }
    
    
}
