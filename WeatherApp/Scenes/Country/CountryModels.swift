//
//  CountryModels.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/30/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Country {
    // MARK: Use cases
    
    enum GetCountry {
        
        struct Request {}
        
        struct Response {
            
            var countries: [CountryModel]
        }
        
        struct ViewModel {
            var tableModel: [CountryModel]
        }
    }
    enum ShowDetails {
        struct Request {
            var country: CountryModel
        }
        
        struct Response {}
        
        struct ViewModel {}
    }
}