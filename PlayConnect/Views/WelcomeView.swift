//
//  WelcomeView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 11/9/25.
//


import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)) // #F5F8FA
                .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()

                // Hero image
                Image("junior-soccer")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 280)
                    .shadow(color: .clear, radius: 0) // no heavy shadows
                    .padding(.top, 60)

                // Title and tagline
                VStack(spacing: 8) {
                    Text("Welcome to")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.48, blue: 0.56, alpha: 1)))
                    Text("PlayConnect") // Example app name
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 0.11, green: 0.23, blue: 0.36, alpha: 1))) // #1B3B5F
                    Text("Find players, join teams, and play smarter.")
                        .font(.system(size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.48, blue: 0.56, alpha: 1)))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }

                Spacer()

                // Buttons
                VStack(spacing: 16) {
                    Button(action: {
                        // navigate to login
                        appState.path.append(Screen.login)

                        
                    }) {
                        Text("Log In")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.31, green: 0.64, blue: 0.82, alpha: 1))) // #4FA3D1
                            .cornerRadius(8)
                    }

                    Button(action: {
                        // navigate to register
                        appState.path.append(Screen.register)
                    }) {
                        Text("Create Account")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color(#colorLiteral(red: 0.11, green: 0.23, blue: 0.36, alpha: 1)))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(#colorLiteral(red: 0.78, green: 0.83, blue: 0.88, alpha: 1)), lineWidth: 1))
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 60)
            }
        }
    }
}

#Preview {
    WelcomeView()
    .environmentObject(AppState())
}
