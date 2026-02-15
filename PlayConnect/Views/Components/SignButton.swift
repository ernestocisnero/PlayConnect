//
//  SignButton.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 2/14/26.
//

import SwiftUI

struct SignButton: View {
    let type: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack(spacing: 20) {
                icon
                    .frame(width: 24, height: 24)
                Text(type == "email" ? "Continue with Email" : type == "google" ? "Continue with Google": type == "login" ? "Log In" : "Sign Up")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                type == "google"
                ? Color("appBlue")
                : Color.black
            )
            .cornerRadius(30)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundColor(.white)
        }
    }
    
    private var icon: some View {
        Group {
            if type == "email" {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
            } else if type == "google" {
                Image("google96")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
            }else{/* No action is intented*/}
        }
    }
}

#Preview {
    SignButton(type: "email", action: {})
}

