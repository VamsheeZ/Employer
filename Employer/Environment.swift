//
//  Environment.swift
//  Employer
//
//  Created by Apple on 29/04/20.
//  Copyright © 2020 CCTech. All rights reserved.
//

import Foundation

class Environment: NSObject {
    
    func getBaseURL() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "Base Url") as! String
    }
    
}
