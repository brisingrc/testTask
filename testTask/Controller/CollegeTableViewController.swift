//
//  CollegeTableViewController.swift
//  testTask
//
//  Created by Мак on 6/28/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

class CollegeTableViewController: UITableViewController {

    var id: Int = 0
    var colleges = [College]()
    var collgeRatings = [CollegeRating]()
    var filteredColleges = [College]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCollegList()
        getCollegeRatings()
        sortCollegesByRating()
        print(filteredColleges)
    }

    // MARK: - Table view data source

    func getCollegList() {
        NetworkService.shared.getCollegeList { colleges in
            self.colleges = colleges
            print(self.colleges.count)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func getCollegeRatings() {
        NetworkService.shared.getCollegesRatings { collegeRatings in
            self.collgeRatings =  collegeRatings.sorted(by: { (lhs, rhs) -> Bool in
                return lhs.rating < rhs.rating
            })
            for item in self.collgeRatings {
                self.filteredColleges.append(self.findCollegeByid(id: item.id))
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func sortCollegesByRating() {
        
    }
    
    func findCollegeByid(id: Int) -> College {
        for college in colleges {
            if college.id == id {
                return college
            } else {
                continue
            }
        }
        return College()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredColleges.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegesCell", for: indexPath) as! CollegesTableViewCell
            cell.configure(college: filteredColleges[indexPath.section])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Didselect method was called")
        id = filteredColleges[indexPath.section].id
        performSegue(withIdentifier: "detailInfoSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CollegeDetailViewController
        vc.id = id
    }
 

}
