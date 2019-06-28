//
//  File.swift
//  testTask
//
//  Created by Мак on 6/28/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation

class NetworkService {
    private init(){}
    
    static let shared = NetworkService()
    
    func makeRequest(url: URL, completionHandler: @escaping(Any) ->()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            do {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                completionHandler(json)
            }
            catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func getCollegeList(completion: @escaping([College]) ->()) {
        guard let url = URL(string: "http://asdgroup.pro/tasks/colleges.json") else {return}
        var colleges = [College]()
        makeRequest(url: url) { json in
            guard let dataArray = json as? [JSON] else {return}
            for item in dataArray {
               print(item)
                    colleges.append(College(item))
            }
            print(colleges)
            completion(colleges)
        }
    }
    
    func getCollegesDetail(completion: @escaping([CollegeDetail]) -> ()) {
        guard let url = URL(string: "http://asdgroup.pro/tasks/details.json") else {return}
        var collegesDetails = [CollegeDetail]()
        makeRequest(url: url) { json in
            guard let dataArray = json as? [JSON] else {return}
            for item in dataArray {
                print(item)
                collegesDetails.append(CollegeDetail(item))
            }
            completion(collegesDetails)
        }
    }
    
    func getCollegesRatings(completion: @escaping([CollegeRating]) -> ()) {
        guard let url = URL(string: "http://asdgroup.pro/tasks/ratings.json") else {return}
        var collegesRatings = [CollegeRating]()
        makeRequest(url: url) { json in
            guard let dataArray = json as? [JSON] else {return}
            for item in dataArray {
                print(item)
                collegesRatings.append(CollegeRating(item))
            }
            completion(collegesRatings)
        }
    }
    
}
