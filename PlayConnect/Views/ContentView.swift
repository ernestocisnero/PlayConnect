//
//  ContentView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 11/9/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appState: AppState = AppState()
    
    
    var body: some View {
        
        NavigationStack(path: $appState.path){
            WelcomeView()
                .navigationDestination(for: Screen.self){ screen in
                    switch screen{
                    case .welcome:
                        WelcomeView()
                    case .login:
                        LoginView()
                    case .register:
                        RegisterView()
                    case .home:
                        HomeView()
                    }
                    
                }
            
        }
        .environmentObject(appState)
    }
}
#Preview {
    ContentView()
}
