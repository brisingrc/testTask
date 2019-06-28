//
//  College.swift
//  testTask
//
//  Created by Мак on 6/28/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation

typealias JSON = [String:Any]

struct College {
    let id: Int
    let name: String
    let abbreviation: String

    
    init(_ dic: JSON) {
        self.id = dic["id"] as? Int ?? 0
        self.name = dic["name"] as? String ?? "Not defined"
        self.abbreviation = dic["abbreviation"] as? String ?? "not defined"
        
    }
    
    init() {
        self.id = 0
        self.name = "not defined"
        self.abbreviation = "not defined"
    }
}

