//
//  Country.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/30/22.
//

import Foundation
import UIKit

struct CountryModel: Decodable {
    let name: String
    let latlng: [Double]?
}
