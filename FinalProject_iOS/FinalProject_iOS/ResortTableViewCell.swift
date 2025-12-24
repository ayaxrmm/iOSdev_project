//
//  ResortTableViewCell.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class ResortTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var item: Resorts?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        iconImageView.layer.cornerRadius = 8
        iconImageView.clipsToBounds = true
    }
    
    
    func configure(with item: Resorts) {
        titleLabel.text = item.title
        iconImageView.image = UIImage(named: item.imageName)
    }

    
}
