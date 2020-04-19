//
//  LoginRequest.swift
//  OnTheMap
//
//  Created by omar Al-joundi on 4/9/20.
//  Copyright © 2020 omar Al-joundi. All rights reserved.
//

import Foundation

struct LoginBody: Codable {
   let udacity: LoginData
}
struct LoginData: Codable {
   let username: String
   let password: String
}
