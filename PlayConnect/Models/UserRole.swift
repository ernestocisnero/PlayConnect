//
//  UserRole.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//

// MARK: - User Role Enum
enum UserRole: String, CaseIterable {
    case player = "player"
    case coach = "coach"
    
    var displayName: String {
        switch self {
        case .player: return "Player"
        case .coach: return "Coach / Team Representative"
        }
    }
    
    var description: String {
        switch self {
        case .player:
            return "Create your profile, showcase highlights, and get discovered"
        case .coach:
            return "Find talent, publish tryouts, and build your team"
        }
    }
}
