//
//  RoleSelectionView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//

import SwiftUI



// MARK: - Role Selection View
struct RoleSelectionView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedRole: UserRole?
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    // Header
                    VStack(spacing: 12) {
                        Text("Welcome to PlayConnect")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text("Choose how you'll use the platform")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 24)
                    
                    // Role Cards
                    VStack(spacing: 16) {
                        RoleCard(
                            role: .player,
                            isSelected: selectedRole == .player,
                            action: { selectedRole = .player }
                        )
                        
                        RoleCard(
                            role: .coach,
                            isSelected: selectedRole == .coach,
                            action: { selectedRole = .coach }
                        )
                    }
                    .padding(.horizontal, 24)
                    
                    // Error Message
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.horizontal, 24)
                    }
                    
                    // Continue Button
                    Button {
                        appState.userIsLoggedIn = false
                    } label: {
                        Group {
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Text("Continue")
                                    .font(.headline)
                            }
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background(selectedRole != nil ? Color(#colorLiteral(red: 0.31, green: 0.64, blue: 0.82, alpha: 1)) : Color.blue.opacity(0.5))
                        .cornerRadius(12)
                    }
                    .disabled(selectedRole == nil || isLoading)
                    .padding(.horizontal, 24)
                    .padding(.top, 8)
                }
                .padding(.bottom, 40)
            }
        }
    }
    
    
}


// MARK: - Preview
#Preview() {
    RoleSelectionView()
}

