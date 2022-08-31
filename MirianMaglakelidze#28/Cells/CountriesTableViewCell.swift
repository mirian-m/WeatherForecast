//
//  CountriesTableViewCell.swift
//  MirianMaglakelidze#28
//
//  Created by Admin on 8/30/22.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    static let identifier = "CountriesTableViewCell"
    
    lazy var countryLb: UILabel = {
        var lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(lb)
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        adjustConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }

    func adjustConstraints() {
        let countryLbConstraints = [
            countryLb.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            countryLb.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        NSLayoutConstraint.activate(countryLbConstraints)
    }
}
