//
//  ReviewService.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

import Foundation

class ReviewService {
    
    static func fetchReviews(completion: @escaping ([Review]) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments")!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let reviews = try JSONDecoder().decode([Review].self, from: data)
                
                DispatchQueue.main.async {
                    completion(Array(reviews.prefix(5))) // 5 отзывов
                }
            } catch {
                print("Error decoding:", error)
            }
        }.resume()
    }
}
