//
//  RestaurantDetailViewController .swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reviewlabel: UILabel!
    
    var restaurant: Restaurants!
    var reviews: [Review] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadReviews()

    }

    private func configureUI() {
        title = restaurant.title
        imageView.image = UIImage(named: restaurant.imageName)
        nameLabel.text = restaurant.title
        ratingLabel.text = "⭐️ \(restaurant.rating)"
        descriptionLabel.text = restaurant.description
        reviewlabel.text = "Loading reviews..."
    }
    private func loadReviews() {
            ReviewService.fetchReviews { reviews in
                self.reviews = reviews
                
                if let firstReview = reviews.first {
                    self.reviewlabel.text =
                    """
                    Review:
                    \(firstReview.body)
                    """
                } else {
                    self.reviewlabel.text = "No reviews available."
                }
            }
        }
    
    @IBAction func bookTapped(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Success",
            message: "You have successfully booked a table!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
    

