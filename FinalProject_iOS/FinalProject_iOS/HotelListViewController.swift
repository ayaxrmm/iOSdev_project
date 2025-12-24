//
//  HotelListViewController.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class HotelListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var item: Hotels?
    
    var rest: [Hotels] = [
        Hotels(imageName: "hotel1", title: "Renion City Hotel", rating: 4.4, description: "Renion City Hotel is located in Almaty, 700 meters from Panfilov Park. Facilities include a fitness center, a restaurant, a bar, and free private parking. The Republic Palace is approximately 2.2 km away, while Raimbek Batyr Metro Station and the Abay Opera and Ballet Theater are 2.2 km and 3.2 km away, respectively. Guests can benefit from the 24-hour front desk, airport shuttle service, room service, and free Wi-Fi throughout the property."),
        Hotels(imageName: "hotel2", title: "Kazakhstan", rating: 3.4,description: "Kazakhstan Express is a hotel in Almaty, 300 meters from the Republic Palace. It features a terrace, a restaurant, a bar, and free private parking. This 3-star hotel also offers an ATM and a business center. Guests can also speak to the 24-hour front desk, arrange airport transfers, order room and beverage service, and enjoy free Wi-Fi throughout the property."),
        Hotels(imageName: "hotel3", title: "Garden Park Inn", rating: 5.0, description: "Garden Park Inn is a hotel in Almaty, 1.4 km from Almaty Central Stadium. Facilities include a fitness center, terrace, restaurant, and free private parking. This 4-star hotel offers city views and a sauna. Guests can also contact the 24-hour front desk, arrange airport transfers, order room and beverage service, and enjoy free Wi-Fi throughout the property."),
        Hotels(imageName: "hotel4", title: "Swissôtel Wellness", rating: 4.4, description: "Situated in Almaty, 20 km from Medeu Sports Complex, Swissôtel Wellness Alatau Almaty Resort features accommodation with a restaurant, free private parking, a fitness centre, and a bar. This 5-star hotel offers a shared lounge and room service. The 24-hour front desk also provides guests with an indoor pool and a hammam."),
        Hotels(imageName: "hotel5", title: "Park Hotel", rating: 2.4, description: "Hotel Services and Amenities, Free Parking, Free WiFi, Fitness Center, Bar/Lounge, Airport Shuttle, Business Center with Wi-Fi, Conference Facilities, 24-Hour Security"),
    ]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hotels"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    
}

extension HotelListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelCell", for: indexPath) as! HotelTableViewCell
        cell.configure(with: rest[indexPath.row])
        return cell
    }
}


extension HotelListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedRestaurant = rest[indexPath.row]
        performSegue(withIdentifier: "showHotelDetail", sender: selectedRestaurant)

        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHotelDetail",
           let vc = segue.destination as? HotelDetailViewController,
           let hotel = sender as? Hotels {
            vc.hotel = hotel
        }
    }


}
