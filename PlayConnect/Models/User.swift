//
//  Users.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//

import Foundation


struct User {
    var id: String
    var name: String
    var email: String
    var avatar: URL?
    var role: UserRole?
    
}

extension User{
    static let exampleUser = User(
        id: UUID().uuidString,
        name: "Ernesto Cisnero",
        email: "ernesto.cisnero@gmail.com",
        avatar: URL(string: "https://i.pravatar.cc/300"),
        role: .player
    )
}
