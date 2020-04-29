//
//  ApiClient.swift
//  Employer
//
//  Created by Apple on 29/04/20.
//  Copyright © 2020 CCTech. All rights reserved.
//

import Foundation

class ApiClient: NSObject {
    
    let baseRequest = BaseRequest()
    
    func getAllEmployees(OnSuccess : @escaping ([Employee]) -> (), OnError : @escaping (String) -> ()) {
        
        baseRequest.JSON_GET(requestType: .employees, parameters: [:], OnSuccess: { (response) in
            let decoder = JSONDecoder()
            do{
                let employeeData = try decoder.decode(EmployeeData.self, from: response)
                if let employees = employeeData.data {
                    OnSuccess(employees)
                }
            }
            catch{
                OnError(error.localizedDescription)
            }
        }) { (error) in
                OnError(error)
        }
        
    }
    
}
