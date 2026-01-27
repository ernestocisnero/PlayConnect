//
//  ContentView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        
        if !appState.userIsLoggedIn {
            WelcomeView()
        }
        else if appState.userIsLoggedIn && appState.isUserFirstTime{
            RoleSelectionView()
        }
        else{
            //Go to Coach or Player Dashboard
            CoachDashboardView()
        }
       
    }
}
#Preview {
    Main()
        .environmentObject(AppState())
}
