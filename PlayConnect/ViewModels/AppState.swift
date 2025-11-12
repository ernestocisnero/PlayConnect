//
//  AppState.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 11/9/25.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var userLoggedIn: Bool = false
    
}
