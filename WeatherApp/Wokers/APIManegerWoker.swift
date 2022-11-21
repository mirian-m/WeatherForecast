//
//  APIManegerWoker.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/31/22.
//

import Foundation
import UIKit

final class APIManeger {
    
    //    MARK:- FetchData by String
    func fetchData<T: Decodable>(by urlString: String, complition: @escaping ((Result<[T], Error>) -> Void)) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  error == nil,
                  let httpResponse = (response as? HTTPURLResponse),
                  (200...299).contains(httpResponse.statusCode) else { return }
            do {
                let result = try JSONDecoder().decode([T].self, from: data)
                complition(.success(result))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
    
    //    MARK:- FetchData by URLRequest
    func fetch<T: Decodable>(by url: URLRequest, complition: @escaping ((Result<T, Error>) -> Void)) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  error == nil,
                  let httpResponse = (response as? HTTPURLResponse),
                  (200...299).contains(httpResponse.statusCode) else { return }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                complition(.success(result))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
    
    func createWeatherUrl(with baseUrl: String, lat: String, lon: String, key: String) -> URLRequest? {
        let urlsString = baseUrl
        guard var urlComponent = URLComponents(string: urlsString) else { return nil }
        urlComponent.queryItems =  [
            URLQueryItem(name: "lat", value: lat),
            URLQueryItem(name: "lon", value: lon),
            URLQueryItem(name: "appid", value: key)
        ]
        var urlRequest = URLRequest(url: (urlComponent.url!))
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
}

