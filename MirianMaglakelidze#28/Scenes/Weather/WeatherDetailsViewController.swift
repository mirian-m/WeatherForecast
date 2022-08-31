//
//  WeatherDetailsViewController.swift
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

protocol WeatherDetailsDisplayLogic: AnyObject {
    func displayWeatherForecast(viewModel: WeatherDetails.GetWeatherForecast.ViewModel)
}

class WeatherDetailsViewController: UITableViewController, WeatherDetailsDisplayLogic {
    var interactor: WeatherDetailsBusinessLogic?
    var router: (NSObjectProtocol & WeatherDetailsRoutingLogic & WeatherDetailsDataPassing)?
    private var offsets = [IndexPath: CGFloat]()
    
    private var weatherForecast = [WeatherForecastModel]()
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = WeatherDetailsInteractor()
        let presenter = WeatherDetailsPresenter()
        let router = WeatherDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherForecast()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func getWeatherForecast() {
        let request = WeatherDetails.GetWeatherForecast.Request()
        interactor?.getWeatherForecast(request: request)
    }
    
    func displayWeatherForecast(viewModel: WeatherDetails.GetWeatherForecast.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.weatherForecast = viewModel.forecastModel!
            self?.tableView.reloadData()
        }
    }
}

extension WeatherDetailsViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WetherTableViewCell", for: indexPath) as? WetherTableViewCell else { return UITableViewCell () }
        cell.setScrollPosition(x: offsets[indexPath] ?? 0)

        if !weatherForecast.isEmpty {
            let startIndex = indexPath.section * 8
            let endIndex = startIndex + 8
            let tempArray = Array (self.weatherForecast[startIndex..<endIndex])
            cell.updateView(with: tempArray)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        TableViewCollectionViewConstants.tableViewNumberOfSection
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        TableViewCollectionViewConstants.heitForRow
    }
}
