//
//  DataService.swift
//  AppWeather
//
//  Created by admin on 5/25/20.
//  Copyright © 2020 Long. All rights reserved.
//

import Foundation
typealias DICT = Dictionary<AnyHashable, Any>
class DataService {
static let shared: DataService = DataService()
var forecastday: Forecastday?
    
    func getDataFromApiClosure(completion: @escaping (Forecastday) -> Void) {
        guard let url = URL(string: "https://api.apixu.com/v1/forecast.json?key=a9a98a4dc3f047d3a9265355180108&q=Paris&days=7") else {return}
        URLSession.shared.dataTask(with: url) { (data,_ ,error) in
        if error != nil {
            print(error!)
        } else {
            if let urlContent = data {
                print(urlContent)
                do {
                    guard let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: .mutableContainers) as? DICT else {return}
                    let forecastDay = Forecastday(dictionary: jsonResult)
                    DispatchQueue.main.async {
                        completion(forecastDay)
                    }
                } catch {
                    print("Error")
                }
            }
        }
            
    }
        .resume()
    }
    
}


