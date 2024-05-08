//
//  Product.swift
//  SwiftUIScreens
//
//  Created by Mac on 27/03/2024.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    var firstImage: String {
        images.first ?? Constants.imageURL
    }
    
    static var mock: Product {
        Product(
            id: 123,
            title: "Macbook Pro",
            description: "Valid good price Macbook Pro",
            price: 3500,
            discountPercentage: 300,
            rating: 4.0,
            stock: 10,
            brand: "Apple",
            category: "Apple",
            thumbnail: Constants.imageURL,
            images: [Constants.imageURL, Constants.imageURL, Constants.imageURL, Constants.imageURL]
        )
    }
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let tile: String
    let products: [Product]
}
