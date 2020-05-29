//
//  ExtensionTimeInterval.swift
//  AppWeather
//
//  Created by admin on 5/25/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit
extension TimeInterval {
    func getDaysOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "EN")
        
        let dayOfWeek = Date(timeIntervalSince1970: self)
        
        return dateFormatter.string(from: dayOfWeek)
    }
}
