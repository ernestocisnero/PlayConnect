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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    // Header
                    VStack(spacing: 12) {
                                                
                        Text("What brings you to the Pitch?")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                            .foregroundStyle(.appBlue)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 24)
                    
                    ZStack {
                        if selectedRole == .coach {
                            Image("")
                                .resizable()
                                .scaledToFit()
                                .transition(.opacity)
                                .frame(maxWidth: 150)
                                .shadow(color: .clear, radius: 0)
                                .padding(.top, 40)
                        } else {
                            Image("")
                                .resizable()
                                .scaledToFit()
                                .transition(.opacity)
                                .frame(maxWidth: 150)
                                .shadow(color: .clear, radius: 0)
                                .padding(.top, 40)
                        }
                    }
                    .animation(.easeInOut(duration: 0.45), value: selectedRole)

                        
                    
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
                    
                    
                    // Continue Button
                    Button {
                        appState.userIsLoggedIn = false//temporal
                        // Update useer role in appState here.
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
                        .background(selectedRole != nil ? Color(.appBlue) : Color(.appBlue).opacity(0.5))
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

