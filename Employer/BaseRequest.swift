//
//  BaseRequest.swift
//  Employer
//
//  Created by Apple on 29/04/20.
//  Copyright © 2020 CCTech. All rights reserved.
//

import Foundation

class BaseRequest: Environment {
    
    func JSON_POST(requestType : RequestType, parameters : [String : Any], OnSuccess : @escaping (Data) -> (), OnFailure : (String) -> () )  {
        let requestURLString = "\(getBaseURL())\(requestType.rawValue)"
        
        
}


}
