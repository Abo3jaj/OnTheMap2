//
//  PostSessionResponse.swift
//  OnTheMap
//
//  Created by omar Al-joundi on 4/11/20.
//  Copyright © 2020 omar Al-joundi. All rights reserved.
//

import Foundation


struct PostSessionResponse : Codable {
    let account : AccountRespnse
    let session : SessionResponse
}
