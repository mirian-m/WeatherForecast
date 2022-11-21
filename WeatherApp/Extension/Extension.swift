//
//  Extension.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/31/22.
//

import Foundation
import UIKit

extension Double {
    mutating func roundingNumber(at decimal: Int) {
        var  m = 1.0
        for _ in 1...decimal {
            m *= 10
        }
        self = (self * m).rounded() / m
    }
}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}

extension Date {
    mutating func addOneDay() {
        self = Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
}

extension UIImageView {
    func getImageBy(urlStr: String) {
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let  data = data, error == nil else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
}
