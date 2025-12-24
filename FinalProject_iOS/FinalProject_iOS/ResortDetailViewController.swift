//
//  ResortDetailViewController.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class ResortDetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var reviewlabel: UILabel!

    var resort: Resorts!
    var reviews: [Review] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadReviews()

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


    private func configureUI() {
        title = resort.title
        imageView.image = UIImage(named: resort.imageName)
        nameLabel.text = resort.title
        ratingLabel.text = "⭐️ \(resort.rating)"
        descriptionLabel.text = resort.description
        reviewlabel.text = "Loading reviews..."
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
