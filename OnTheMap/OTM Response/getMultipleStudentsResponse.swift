//
//  Student.swift
//  OnTheMap
//
//  Created by omar Al-joundi on 4/9/20.
//  Copyright © 2020 omar Al-joundi. All rights reserved.
//

import Foundation


struct getMultipleStudentsResponse : Codable {
    let firstName: String
    let lastName: String
    let latitude: Double
    let longitude: Double
    let mapString: String
    let mediaURL: String
    let objectId: String?
    let uniqueKey: String
    let updatedAt:String?
    let createdAt:String?
  
}
