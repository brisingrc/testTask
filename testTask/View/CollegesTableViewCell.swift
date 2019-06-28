//
//  CollegesTableViewCell.swift
//  testTask
//
//  Created by Мак on 6/28/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

class CollegesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var abbreviationLabel: UILabel!
    
    func configure(college: College) {
        self.nameLabel.text = college.name
        self.abbreviationLabel.text = college.abbreviation
    }

}
