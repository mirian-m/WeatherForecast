//
//  WeatherDetailsCollectionViewCell.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/31/22.
//

import UIKit

final class WeatherDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLb: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLb: UILabel!
    
    func configureView(from model: WeatherForecastModel) {
        self.timeLb.text = model.time
        self.weatherImage.image = model.weatherImage
        self.tempLb.text = model.temperature
    }
}
