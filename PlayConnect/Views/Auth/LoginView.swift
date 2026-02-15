//
//  LoginView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//


import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack {
            Color("appWhiteBackground")
                .opacity(0.5)
                .ignoresSafeArea()

            VStack(spacing: 28) {
                VStack(spacing: 6) {
                    Text("Welcome Back")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                    Text("Let’s continue where you left off.")
                        .font(.system(size: 18, weight: .light, design: .rounded))
                        .foregroundColor(.black)
                }

                VStack(spacing: 18) {
                    TextField("Email", text: $email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 1))

                    SecureField("Password", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 1))
                }
                
                SignButton(type:"login", action: { appState.userIsLoggedIn = true })
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 100)
        }
        
    }
    
}

#Preview {
    
    LoginView()
    .environmentObject(AppState())
    
}
