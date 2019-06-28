//
//  CollegeDetail.swift
//  testTask
//
//  Created by Мак on 6/28/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation

struct CollegeDetail {
    let id: Int
    let site: String
    
    init(_ dic: JSON) {
        self.id = dic["college_id"] as? Int ?? 0
        self.site = dic["site"] as? String ?? "Site doesn't present"
    }
}
