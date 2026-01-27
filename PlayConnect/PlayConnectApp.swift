//
//  PlayConnectApp.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//

import SwiftUI
//import FirebaseCore


@main
struct PlayConnectApp: App {
    @StateObject private var appState: AppState = AppState()

    //Initialize Firebase connection.
    //init(){
       // FirebaseApp.configure()
  //  }
    
    
    var body: some Scene {
        WindowGroup {
            Main()
                .environmentObject(appState)
        }
    }
}
