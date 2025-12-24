//
//  TopPlace.swift
//  FinalProject_iOS
//
//  Created by Aya on 18.12.2025.
//

enum PlaceType: String, Decodable {
    case restaurant
    case hotel
    case culture
    case resort
}

struct Place: Decodable {
    let name: String
    let description: String?
    let image: String
    let rating: Double?
    let type: PlaceType
}
