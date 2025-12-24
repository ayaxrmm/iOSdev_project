//
//  HotelViewController.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class HotelViewController: UIViewController {
 
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    
    @IBOutlet weak var topPlaceCollectionView: UICollectionView!
    
    
    let banners = [
        Banner(imageName: "almaty"),
        Banner(imageName: "astana")
    ]
    let topPlaces: [Place] = [
        Place(name: "Sandyq", description: "", image: "hotel1", rating: 4.6, type: .restaurant),
        Place(name: "Shymbulak",  description: "", image: "hotel1", rating: 4.8, type: .resort),
        Place(name: "Kasteev Museum",  description: "", image: "hotel1", rating: 4.7, type: .culture),
        Place(name: "Hotel",  description: "", image: "hotel1", rating: 4.7, type: .hotel)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        topPlaceCollectionView.delegate = self
        topPlaceCollectionView.dataSource = self
    }
    
    
    @IBAction func seeAllTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showHotelList", sender: nil)
    }
    
    
}


extension HotelViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView {
            return banners.count
        } else {
            return topPlaces.count
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == bannerCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "BannerCell",
                for: indexPath) as! BannerCell
            cell.configure(with: banners[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TopPlaceCell",
                for: indexPath) as! TopPlaceCell
            cell.configure(with: topPlaces[indexPath.item])
            return cell
        }
    }
}

//extension HotelViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.bounds.width - 60
//        return CGSize(width: width, height: 193)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 16
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//    }
//}

extension HotelViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected: \(indexPath.item)")
    }
}
