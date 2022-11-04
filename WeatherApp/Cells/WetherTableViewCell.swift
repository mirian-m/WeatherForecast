//
//  WetherTableViewCell.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/31/22.
//

import UIKit

class WetherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherDetailsCollectionView: UICollectionView! {
        didSet {
            weatherDetailsCollectionView.backgroundView?.layer.cornerRadius = 10
            weatherDetailsCollectionView.dataSource = self
            weatherDetailsCollectionView.delegate = self
        }
    }
    
    private var forecastModel = [WeatherForecastModel]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func updateView(with model: [WeatherForecastModel]) {
        DispatchQueue.main.async {[weak self] in
            self?.forecastModel = model
            self?.weatherDetailsCollectionView.reloadData()
        }
        
    }

}

extension WetherTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setScrollPosition(x: CGFloat) {
        weatherDetailsCollectionView.setContentOffset(CGPoint(x: x, y: 0), animated: false)
    }
    
    func getScrollPosition() -> CGFloat {
        return weatherDetailsCollectionView.contentOffset.x
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        TableViewCollectionViewConstants.collectionViewNumberOfItemInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.layer.bounds.width / 8, height: TableViewCollectionViewConstants.heitForRow)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherDetailsCollectionViewCell", for: indexPath) as? WeatherDetailsCollectionViewCell else { return UICollectionViewCell() }
        if !forecastModel.isEmpty {
            let cureentForecast = forecastModel[indexPath.row]
            collectionViewCell.configureView(from: cureentForecast)
        }
        return collectionViewCell
    }
}
