//
//  CollegeDetailViewController.swift
//  testTask
//
//  Created by Мак on 6/28/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

class CollegeDetailViewController: UIViewController {

    var id: Int?
    @IBOutlet weak var detailInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDetailinfo(id: id)
    }

    func getDetailinfo(id: Int?) {
        guard let id = id else {return}
        NetworkService.shared.getCollegesDetail { collegesRatings in
        for item in collegesRatings {
                if item.id == id {
                    print(item.site)
                    DispatchQueue.main.async {
                         self.detailInfo.text = item.site
                    }
                   
                }
            }
        }
    }
}
