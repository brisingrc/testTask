//
//  CollegeRating.swift
//  testTask
//
//  Created by Мак on 6/28/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation

struct CollegeRating {
    
    
    let id: Int
    let rating: Double
    
    init (_ dic: JSON) {
    self.rating = dic["rating"] as? Double ?? 0
    self.id = dic["college_id"] as? Int ?? 0
    }
}

