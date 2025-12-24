//
//  BannerCell.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with banner: Banner) {
        bannerImageView.image = UIImage(named: banner.imageName)
    }
}
