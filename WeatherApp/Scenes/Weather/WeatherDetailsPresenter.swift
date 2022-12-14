//
//  WeatherDetailsPresenter.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/31/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol WeatherDetailsPresentationLogic {
  func presentWeatherForecast(response: WeatherDetails.GetWeatherForecast.Response)
}

final class WeatherDetailsPresenter: WeatherDetailsPresentationLogic {
  weak var viewController: WeatherDetailsDisplayLogic?
  
  // MARK: Do something
  
  func presentWeatherForecast(response: WeatherDetails.GetWeatherForecast.Response) {
    let viewModel = WeatherDetails.GetWeatherForecast.ViewModel(forecastModel: createForecastViewModel(by: response.weatherForecast!))
    viewController?.displayWeatherForecast(viewModel: viewModel)
  }
    
    func createForecastViewModel(by models: [Weather]) -> [WeatherForecastModel]? {
        var weatherForecast = [WeatherForecastModel]()
        for model in models {
            let weatherForecastModel = WeatherForecastModel()
            var celciusValue = model.main.temp - 273.15
            celciusValue.roundingNumber(at: 2)
            let iconUrl = model.weather?.first?.icon ?? ""
            let urlString = "\(WeatherAPI.IconAPI.iconBaseUrl.rawValue)\(iconUrl).png"
            weatherForecastModel.weatherImage = getImage(urlString: urlString)
            weatherForecastModel.temperature = "\(celciusValue)"
            
            
            let stringIndex = model.time!.firstIndex(of: " ")
            let time = model.time?.substring(from: stringIndex!).trimmingCharacters(in: .whitespaces).dropLast(3)
            weatherForecastModel.time = String(time!)
            weatherForecast.append(weatherForecastModel)
        }
        return weatherForecast
    }

   private func getImage(urlString: String) -> UIImage? {
        guard let url = URL(string: urlString) else { return nil}
        do {
            let data = try Data(contentsOf: url)
            guard let image = UIImage(data: data) else { return nil}
            return image
        } catch {
            print(error)
        }
        return UIImage()
    }

}
