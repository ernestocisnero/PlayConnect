//
//  RegisterView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 11/9/25.
//


import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var appState: AppState
    
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var selectedRole: String = "Player"
    @State private var selectedPosition: String = "Forward"
    
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
                    TextField("Full Name", text: $fullName)
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
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Registering as")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(#colorLiteral(red: 0.11, green: 0.23, blue: 0.36, alpha: 1))) // #1B3B5F
                    
                    Picker("Role", selection: $selectedRole) {
                        ForEach(roles, id: \.self) { role in
                            Text(role).tag(role)
                        }
                    }
                
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .animation(.easeInOut, value: selectedRole)
                    
                    // Conditional position picker
                        if selectedRole == "Player" {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Preferred Position")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color(#colorLiteral(red: 0.11, green: 0.23, blue: 0.36, alpha: 1)))

                                Picker("Position", selection: $selectedPosition) {
                                    ForEach(positions, id: \.self) { position in
                                        Text(position).tag(position)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .frame(maxWidth: .infinity)
                                .padding(5)
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(#colorLiteral(red: 0.78, green: 0.83, blue: 0.88, alpha: 1)), lineWidth: 1)
                                )
                                .padding(.horizontal)
                                .transition(.move(edge: .top).combined(with: .opacity))
                                .animation(.easeInOut(duration: 0.3), value: selectedRole)
                            }
                        }
                    }
                    .padding(.top, 8)

                Button(action: {
                    // registration logic
                    //Actions to get user data and make the corresponding validations
                    
                    appState.userLoggedIn = true
                    appState.path.append(Screen.home)
                }) {
                    Text("Sign Up")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.31, green: 0.64, blue: 0.82, alpha: 1))) // #4FA3D1
                        .cornerRadius(8)
                }

                HStack {
                    Text("Already have an account?")
                        .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.48, blue: 0.56, alpha: 1)))
                    Button("Log In") {
                        // navigate back to login
                        
                        appState.path.append(Screen.login)
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.31, green: 0.64, blue: 0.82, alpha: 1)))
                    .fontWeight(.semibold)
                }
                .font(.system(size: 15))
                .padding(.top, 8)

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
