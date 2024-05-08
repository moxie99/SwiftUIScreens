//
//  DatabseHelper.swift
//  SwiftUIScreens
//
//  Created by Mac on 27/03/2024.
//

import Foundation


struct DatabaseHelper {
    
    func getProduct() async throws -> [Product] {
        guard let productURL = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: productURL)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        return products.products
    }
    
    func getUsers() async throws-> [User] {
        guard let userURL = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: userURL)
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        return users.users
    }
}
