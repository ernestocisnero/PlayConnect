//
//  RoleCard.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//

import SwiftUI

// MARK: - Role Card Component
struct RoleCard: View {
    let role: UserRole
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // Icon
                ZStack {
                    Circle()
                        .fill(isSelected ? Color(.appBlue).opacity(0.3) : Color(.systemGray6))
                        .frame(width: 60, height: 60)
                    
                    if role == .player {
                        Image(systemName: "soccerball")
                    } else {
                        Image(systemName: "clipboard")
                    }
                }
                
                // Text Content
                VStack(alignment: .leading, spacing: 4) {
                    Text(role.displayName)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundStyle(.black)

                    Text(role.description)
                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                        .foregroundStyle(.secondary)
                        
                }
                
                Spacer()
                
                // Selection Indicator
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(isSelected ? Color(.appBlue) : Color(.systemGray4))
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.appWhiteBackground))
                    .shadow(color: isSelected ? Color(.appBlue).opacity(0.2) : Color.black.opacity(0.05),
                            radius: isSelected ? 8 : 4,
                            x: 0,
                            y: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? Color(.appBlue) : Color.clear, lineWidth: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    RoleCard(role:.coach, isSelected: false, action: { })
}
