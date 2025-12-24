//
//  TopPlaceCell.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class TopPlaceCell: UICollectionViewCell {
    
    
    @IBOutlet weak var topPlaceImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with place: Place) {
        topPlaceImageView.image = UIImage(named: place.image)
        titleLabel.text = place.name
        ratingLabel.text = "\(place.rating)"
    }
    
}
