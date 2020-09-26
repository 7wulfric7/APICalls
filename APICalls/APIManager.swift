//
//  APIManager.swift
//  APICalls
//
//  Created by Deniz Adil on 9/25/20.
//

import Foundation

let API_BASE_URL = "https://www.metaweather.com/api/"

class APIManager {
static let shared = APIManager()
    init() {}
    
//    https://www.metaweather.com/api/location/search/?query=san
    
    func searchLocation(searchText: String, completion: @escaping (_ json: [[String:Any]]?, _ error: Error?) -> ()) {
        let url = API_BASE_URL + "location/search/?query=" + searchText
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
                return
            }
            if let data = data {
                if let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] {
                completion(json, nil)
//                print("Json: ", json)
                }
            }
        }.resume()
    }
}
