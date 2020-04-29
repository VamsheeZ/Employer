//
//  EmployeeCodables.swift
//  Employer
//
//  Created by Apple on 29/04/20.
//  Copyright © 2020 CCTech. All rights reserved.
//

import Foundation

struct EmployeeData : Codable {
    let data : [Employee]?
}

struct Employee : Codable {
    let id : String
    let employee_name : String
    let employee_salary : String
    let employee_age : String
    let profile_image : String
}
