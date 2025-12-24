//
//  RestaurantsTableViewCell.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class RestaurantsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var item: Restaurants?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        iconImageView.layer.cornerRadius = 8
        iconImageView.clipsToBounds = true
    }
    
    
    func configure(with item: Restaurants) {
        titleLabel.text = item.title
        iconImageView.image = UIImage(named: item.imageName)
    }

}
