//
//  ViewController.swift
//  APICalls
//
//  Created by Deniz Adil on 9/25/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblCoordinates: UILabel!
    @IBOutlet weak var lblId: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIManager.shared.searchLocation(searchText: "sa") { (json, error) in
            DispatchQueue.main.async {
                if let json = json {
                    let index = Int.random(in: 0..<json.count)
                    
                    let cityJson = json[index]
                    self.populateData(cityJson: cityJson)
                }
            }
        }
    }
  
    func populateData(cityJson: [String:Any]) {
        if let title = cityJson["title"] as? String {
            lblTitle.text = title
        }
    if let type = cityJson["location_type"] as? String {
    lblType.text = type
    }
    if let woeid = cityJson["woeid"] as? Int {
    lblId.text = "\(woeid)"
    }
    if let location = cityJson["latt_long"] as? String {
    lblCoordinates.text = location
    }
    }
    
    @IBAction func onClick(_ sender: UIButton) {
    }
}
