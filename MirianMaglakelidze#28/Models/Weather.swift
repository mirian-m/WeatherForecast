//
//  Weather.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/30/22.
//

import Foundation
import UIKit

struct Weather: Decodable {
    enum CodingKeys: String, CodingKey {
        case weather, main, name
        case time = "dt_txt"
    }

    struct WeatherDetails: Decodable {
        var id : Int
        var main: String
        var description: String
        var icon: String
        
    }
    struct Main: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    let weather: [WeatherDetails]?
    let main: Main
    let name: String?
    let time: String?
}

