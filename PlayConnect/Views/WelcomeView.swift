//
//  WelcomeView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//


import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var appState: AppState
    @State private var showLogIn: Bool = false
    @State private var showRegister: Bool = false
    
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
                    .shadow(color: .clear, radius: 0)
                    .padding(.top, 60)

                // Title and tagline
                VStack(spacing: 8) {
                    Text("Welcome to")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.48, blue: 0.56, alpha: 1)))
                    Text("PlayConnect")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 0.11, green: 0.23, blue: 0.36, alpha: 1))) // #1B3B5F
                    Text("Find players, join teams, and play smarter.")
                        .font(.system(size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.48, blue: 0.56, alpha: 1)))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }

                Spacer()

                if !appState.appIsLoading {
                    //Here most check if user exists in firebase and set appIsLoading to false
                    ProgressView()
                        .tint(Color(#colorLiteral(red: 0.11, green: 0.23, blue: 0.36, alpha: 1)))
                        .padding(.bottom, 60)
                }else {
                    // Log in button
                    VStack(spacing: 16) {
                        Button(action: {
                            showLogIn = true

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
                            // Register button
                            showRegister = true
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
        .sheet(isPresented: $showLogIn ){
            LoginView()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $showRegister ){
            RegisterView()
                .presentationDetents([.fraction(0.75)])
                .presentationDragIndicator(.visible)
        }
        
    }
}

#Preview {
    WelcomeView()
        .environmentObject(AppState())
}
