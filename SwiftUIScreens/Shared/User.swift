//
//  User.swift
//  SwiftUIScreens
//
//  Created by Mac on 27/03/2024.
//

import Foundation
struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let gender: Gender
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height: Int
    let weight: Double
    let macAddress, university: String
    
    var work: String {
        "Works as a software engineer"
    }
    var education: String {
        "Studied at MIT"
    }
    
    var aboutMe: String {
        "I am a versatile software engineer"
    }
    
    var basics: [UserInterest] {
        [
            UserInterest(
                iconame: "ruler",
                emoji: nil,
                text: "\(height)"
            ),
            UserInterest(
                iconame: "graduationcap",
                emoji: nil,
                text: education
            ),
            UserInterest(
                iconame: "wineglass",
                emoji: nil,
                text: "Socially"
            ),
            UserInterest(
                iconame: "moon.stars.fill",
                emoji: nil,
                text: "Virgo"
            )
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(
                iconame: nil,
                emoji: "👟",
                text: "Running"
            ),
            UserInterest(
                iconame: nil,
                emoji: "🎬",
                text: "Acting"
            ),
            UserInterest(
                iconame: nil,
                emoji: "💪",
                text: "Gym"
            ),
            UserInterest(
                iconame: nil,
                emoji: "🎼",
                text: "Music"
            ),
        ]
    }
    
    var images: [String] {
        [Constants.imageURL, Constants.imageURL2, Constants.imageURL3]
    }
    
    static var mock: User {
        User(
            id: 129,
            firstName: "Nick",
            lastName: "Saro",
            age: 45,
            gender: Gender.male,
            email: "xyz@gmail.com",
            phone: "09089890090",
            username: "NickCannon",
            password: "123123David",
            birthDate: "23-12-2002",
            image: Constants.imageURL,
            bloodGroup: "AA",
            height: 180,
            weight: 280.23,
            macAddress: "123-123-9090-000",
            university: "FUTA"
        )
    }
}
