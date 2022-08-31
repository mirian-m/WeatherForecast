//
//  Country.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/30/22.
//

import Foundation
import UIKit

struct CountryModel: Decodable {
//    struct Coordinate: Decodable {
//        enum CodingKeys: String, CodingKey {
//            case lat = "0"
//            case lag = "1"
//        }
//        var lat: Double
//        var lag: Double
//    }
    let name: String
    let latlng: [Double]?
}
