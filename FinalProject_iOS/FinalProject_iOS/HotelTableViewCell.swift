//
//  HotelTableViewCell.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class HotelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconimageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var item: Hotels?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        iconimageView.layer.cornerRadius = 8
        iconimageView.clipsToBounds = true
    }
    
    
    func configure(with item: Hotels) {
        nameLabel.text = item.title
        iconimageView.image = UIImage(named: item.imageName)
    }

    
}
