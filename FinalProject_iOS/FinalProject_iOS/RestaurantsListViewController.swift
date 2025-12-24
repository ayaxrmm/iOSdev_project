//
//  RestaurantsListViewController.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class RestaurantsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var item: Restaurants?
    
    var rest: [Restaurants] = [
        Restaurants(imageName: "rest1", title: "Nuala", rating: 4.4, description: "Renion City Hotel is located in Almaty, 700 meters from Panfilov Park. Facilities include a fitness center, a restaurant, a bar, and free private parking. The Republic Palace is approximately 2.2 km away, while Raimbek Batyr Metro Station and the Abay Opera and Ballet Theater are 2.2 km and 3.2 km away, respectively. Guests can benefit from the 24-hour front desk, airport shuttle service, room service, and free Wi-Fi throughout the property."),
        Restaurants(imageName: "rest2", title: "Sandyq", rating: 3.4, description: "Hotel Services and Amenities, Free Parking, Free WiFi, Fitness Center, Bar/Lounge, Airport Shuttle, Business Center with Wi-Fi, Conference Facilities, 24-Hour Security"),
        Restaurants(imageName: "rest3", title: "Beefeater", rating: 5.0, description: "HOTEL STYLE, Unusual, Luxurious"),
        Restaurants(imageName: "rest4", title: "Seven Bar", rating: 4.4, description: "ituated in a picturesque mountain gorge within the Ile-Alatau National Park, a 40-minute drive from Almaty's city center and the airport, the resort offers a truly relaxing experience, immersing you in nature."),
        Restaurants(imageName: "rest5", title: "Дареджани", rating: 2.4, description: "ituated in a picturesque mountain gorge within the Ile-Alatau National Park, a 40-minute drive from Almaty's city center and the airport, the resort offers a truly relaxing experience, immersing you in nature."),
    ]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Restaurants"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    
}

extension RestaurantsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsCell", for: indexPath) as! RestaurantsTableViewCell
        cell.configure(with: rest[indexPath.row])
        return cell
    }
}


extension RestaurantsListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedRestaurant = rest[indexPath.row]
        performSegue(withIdentifier: "showRestaurantDetail", sender: selectedRestaurant)

        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail",
           let vc = segue.destination as? RestaurantDetailViewController,
           let restaurant = sender as? Restaurants {
            vc.restaurant = restaurant
        }
    }
}



