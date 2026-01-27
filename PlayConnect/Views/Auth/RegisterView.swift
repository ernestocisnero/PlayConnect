//
//  RegisterView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//


import SwiftUI
//import FirebaseAuth

struct RegisterView: View {
    @EnvironmentObject var appState: AppState
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)) // #F5F8FA
                .ignoresSafeArea()
            
            VStack(spacing: 28) {
                VStack(spacing: 6) {
                    Text("Create Account")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 0.11, green: 0.23, blue: 0.36, alpha: 1))) // #1B3B5F
                    Text("Let’s get started with your new account.")
                        .font(.system(size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.48, blue: 0.56, alpha: 1))) // #6B7A8F
                }
                
                VStack(spacing: 18) {
                    TextField("Full Name", text: $userName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(#colorLiteral(red: 0.78, green: 0.83, blue: 0.88, alpha: 1)), lineWidth: 1))
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(#colorLiteral(red: 0.78, green: 0.83, blue: 0.88, alpha: 1)), lineWidth: 1))
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(#colorLiteral(red: 0.78, green: 0.83, blue: 0.88, alpha: 1)), lineWidth: 1))
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(#colorLiteral(red: 0.78, green: 0.83, blue: 0.88, alpha: 1)), lineWidth: 1))
                }
                Divider()
                
                Button(action: {
                    //Function to register user
                    
                    appState.userIsLoggedIn = true
                }) {
                    Text("Create Account")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.31, green: 0.64, blue: 0.82, alpha: 1))) // #4FA3D1
                        .cornerRadius(8)
                }
                
               Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 100)
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(AppState())
}
