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
            Color("appWhiteBackground")
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 28) {
                VStack(spacing: 6) {
                    Text("Create Account")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                    Text("Let’s get started with your new account.")
                        .font(.system(size: 18, weight: .light, design: .rounded))
                        .foregroundColor(.black)
                }
                
                VStack(spacing: 18) {
                    TextField("Full Name", text: $userName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 1))
                    
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
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 1))
                }
                Divider()
                
                SignButton(type:"signup", action: { appState.userIsLoggedIn = true })
              
                
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
