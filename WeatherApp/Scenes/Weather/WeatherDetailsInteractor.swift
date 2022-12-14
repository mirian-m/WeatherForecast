//
//  WeatherDetailsInteractor.swift
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

protocol WeatherDetailsBusinessLogic {
    func getWeatherForecast(request: WeatherDetails.GetWeatherForecast.Request)
}

protocol WeatherDetailsDataStore {
    var countryCoordinate: (lat: String, lon: String)? { get set }
}

final class WeatherDetailsInteractor: WeatherDetailsBusinessLogic, WeatherDetailsDataStore {
    var presenter: WeatherDetailsPresentationLogic?
    var worker: APIManeger?
    var countryCoordinate: (lat: String, lon: String)? = (lat: "String", lon: "String")

    // MARK: Do something
    
    func getWeatherForecast(request: WeatherDetails.GetWeatherForecast.Request) {
        worker = APIManeger()
        
        let urlString = WeatherAPI.forecastFor5DaysBaseUrl
        guard let urlRequest = worker?.createWeatherUrl(with: urlString, lat: countryCoordinate!.lat, lon: countryCoordinate!.lon, key: WeatherAPI.APIKey) else { return }
        
        worker?.fetch(by: urlRequest, complition: { [weak self] (result: Result<LongWeatherForecast, Error>) in
            var response = WeatherDetails.GetWeatherForecast.Response()
            switch result {
            case .success(let forecast) :
                response.weatherForecast = forecast.list
            case.failure(let error):
                print(error)
            }
            self?.presenter?.presentWeatherForecast(response: response)
        })
        
    }
}
