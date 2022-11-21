//
//  ConstanFile.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/30/22.
//

import Foundation
import UIKit

final class WeatherAPI {
    enum IconAPI: String {
        case iconBaseUrl = "https://raw.githubusercontent.com/CodeExplainedRepo/Weather-App-JavaScript/master/icons/"
    }
    static let APIKey = "468e0793ec6fa347e6822044fa5aad60"
    static let currentWeatherBaseUrl = "https://api.openweathermap.org/data/2.5/weather"
    static let forecastFor5DaysBaseUrl = "https://api.openweathermap.org/data/2.5/forecast"
}

final class CountryConstants {
    static let url = "https://restcountries.com/v2/all"
}

final class TableViewCollectionViewConstants {
    static let heitForRow: CGFloat = 200
    static let tableViewNumberOfSection = 5
    static let collectionViewNumberOfItemInSection = 8
}
