//
//  User.swift
//  SwiftProjects
//
//  Created by Toni Stoyanov on 20.01.25.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Double // <- Double not Int
    let weight: Double
    
    static var mock: User {
        User(
            id: 444,
            firstName: "Toni",
            lastName: "Stoyanov",
            age: 32,
            email: "test@abv.bg",
            phone: "",
            username: "",
            password: "",
            image: Constants.randomImage,
            height: 180,
            weight: 200
        )
    }
}
