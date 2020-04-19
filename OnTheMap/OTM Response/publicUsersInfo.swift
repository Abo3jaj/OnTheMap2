//
//  Login Response.swift
//  OnTheMap
//
//  Created by omar Al-joundi on 4/10/20.
//  Copyright © 2020 omar Al-joundi. All rights reserved.
//

import Foundation


struct getUsersInfo : Codable {
    let user : userInfo
}


struct userInfo : Codable {
    let first_name : String
    let last_name : String
    let key : String
}
