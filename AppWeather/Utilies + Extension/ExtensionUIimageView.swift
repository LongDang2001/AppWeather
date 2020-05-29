//
//  ExtensionUIimageView.swift
//  AppWeather
//
//  Created by admin on 5/25/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit
extension UIImageView {
    func imageUrlString(urlString: String, indexpath: IndexPath) {
        guard let url = URL(string: urlString) else {return}
        DispatchQueue.global().async {
            if let data = try?  Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)

                }
            }
        }
    }
}
