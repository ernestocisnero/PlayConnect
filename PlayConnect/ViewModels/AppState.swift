//
//  AppState.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var user: User?
    
    @Published var userIsLoggedIn: Bool = false

    @Published var appIsLoading: Bool = true
    
    @Published var isUserFirstTime: Bool = true
    //@AppStorage("isUserFirstTime") var isUserFirstTime: Bool = true
    
}
