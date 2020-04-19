//
//  getMultipleStudentsRequest.swift
//  OnTheMap
//
//  Created by omar Al-joundi on 4/13/20.
//  Copyright © 2020 omar Al-joundi. All rights reserved.
//

import Foundation

struct getMultipleStudentsRequest : Codable {
    let limit : Int?
    let skip : Int?
    let order : String?
    let uniqeKey : String?
    
}
