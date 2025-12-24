//
//  ResortListViewController.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import UIKit

class ResortListViewController: UIViewController {
    
 
    @IBOutlet weak var tableView: UITableView!
    
    
    var item: Resorts?
    
    var rest: [Resorts] = [
        Resorts(imageName: "resort1", title: "Mercure", rating: 4.4, description: "An ideal choice for business and leisure travelers, this hotel is located in the city center, close to a number of attractions. It offers guests two restaurants serving exquisite cuisine, a lobby bar, four spacious conference rooms, and a relaxing spa. The hotel features 117 guest rooms with all amenities and unique interiors inspired by local culture and traditional art."),
        Resorts(imageName: "resort2", title: "Park Hotel", rating: 3.4,description: "Hotel Services and Amenities, Free Parking, Free WiFi, Fitness Center, Bar/Lounge, Airport Shuttle, Business Center with Wi-Fi, Conference Facilities, 24-Hour Security "),
        Resorts(imageName: "resort3", title: "Meridian Resort", rating: 5.0, description: "HOTEL STYLE, Unusual, Luxurious"),
        Resorts(imageName: "resort4", title: "Tau Samal", rating: 4.4, description: "HOTEL STYLE, Budget, Reasonably priced"),
        Resorts(imageName: "resort5", title: "Oi-Qaragai Mountain Resort", rating: 2.4, description: "Situated in a picturesque mountain gorge within the Ile-Alatau National Park, a 40-minute drive from Almaty's city center and the airport, the resort offers a truly relaxing experience, immersing you in nature."),
    ]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Resorts"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    
}

extension ResortListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResortCell", for: indexPath) as! ResortTableViewCell
        cell.configure(with: rest[indexPath.row])
        return cell
    }
}


extension ResortListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedRestaurant = rest[indexPath.row]
        performSegue(withIdentifier: "showResortDetail", sender: selectedRestaurant)

        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResortDetail",
           let vc = segue.destination as? ResortDetailViewController,
           let resorts = sender as? Resorts {
            vc.resort = resorts
        }
    }
}




    
