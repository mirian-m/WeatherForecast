//
//  CountriesTableViewCell.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/30/22.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    static let identifier = "CountriesTableViewCell"
    
   private lazy var countryLb: UILabel = {
        var lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = .zero
        self.contentView.addSubview(lb)
        return lb
    }()
    
    private lazy var flag: UIImageView = {
        let flagImage = UIImageView()
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        flagImage.contentMode = .scaleToFill
        self.contentView.addSubview(flagImage)
       return flagImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .detailDisclosureButton
        self.backgroundColor = .systemGray
        adjustConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateCell(countryDetails: CountryModel) {
        countryLb.text = countryDetails.name
        flag.getImageBy(urlStr: countryDetails.flags?.png ?? "")
    }
    
    private func adjustConstraints() {
        let countryLbConstraints = [
            countryLb.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            countryLb.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -10),
            countryLb.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        
        let flagConstraints = [
            flag.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            flag.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            flag.widthAnchor.constraint(equalToConstant: 70),
            flag.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10)
            
        ]
        
        NSLayoutConstraint.activate(countryLbConstraints)
        NSLayoutConstraint.activate(flagConstraints)
    }
}
