//
//  BaseRequest.swift
//  Employer
//
//  Created by Apple on 29/04/20.
//  Copyright © 2020 CCTech. All rights reserved.
//

import Foundation
import Alamofire


class BaseRequest: Environment {
    
    func JSON_POST(requestType : RequestType, parameters : [String : Any], OnSuccess : @escaping (Data) -> (), OnFailure : @escaping (String) -> () )  {
        let requestURLString = "\(getBaseURL())\(requestType.rawValue)"
        
        AF.request(requestURLString, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseData { (dataResponse) in
            
            switch dataResponse.result {
            case .success(let data) :
                OnSuccess(data)
                break
            case .failure(let error) :
                OnFailure(error.localizedDescription)
                break
                
            }
            
        }
        
    }
    
    
    func JSON_GET(requestType : RequestType, parameters : [String : Any], OnSuccess : @escaping (Data) -> (), OnFailure : @escaping (String) -> ()) {
        let requestURLString = "\(getBaseURL())\(requestType.rawValue)"
        
        print("\(requestURLString)")
         
        AF.request(requestURLString, method: .get, parameters: [:], encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseData { (dataResponse) in
             
             switch dataResponse.result {
             case .success(let data) :
                 OnSuccess(data)
                 break
             case .failure(let error) :
                 OnFailure(error.localizedDescription)
                 break
                 
             }
             
         }
    }
    


}
