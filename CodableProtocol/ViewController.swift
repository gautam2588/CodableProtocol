//
//  ViewController.swift
//  CodableProtocol
//
//  Created by Gautam arora on 7/25/18.
//  Copyright © 2018 Gautamarora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /************Encoding****************/
        let compayObject = Company(name: "Mobile", foundingYear: 2018, location:Coordinates(latitude:20.121,longitude:79.101), webSite:URL(string: "www.mobile.com"), subLocations: [Locations(locationName:"Bengaluru",locationLat:12.9716,locationLong:77.5946)], information: ["headquaters":"India"], services: Services.Mobile)
        
        /*******One way**********/
        let encodeObject = try? JSONEncoder().encode(compayObject)
        print(String(data: encodeObject!,encoding: .utf8)!)
        
        /*******Another way**********/
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(compayObject)
            let jsonString = String(data: jsonData, encoding: .utf8)
            print("JSON String : " + jsonString!)
        }
        catch {
        }
        
        /************Decoding****************/
         let jsonDecoder = JSONDecoder()
         /*******One way**********/
       
        if let jsonData = try? jsonDecoder.decode(Company.self, from:encodeObject!){
            print(jsonData)
        }
          /*******Another way**********/
        do {
            let jsonData = try jsonDecoder.decode(Company.self, from:encodeObject!)
            print(jsonData)
        }
        catch {
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

