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
                        .fill(isSelected ? Color.blue.opacity(0.15) : Color(.systemGray6))
                        .frame(width: 60, height: 60)
                    
                    if role == .player {
                        Image(systemName: "p.square.fill")
                    } else {
                        Image(systemName: "c.square.fill")
                    }
                }
                
                // Text Content
                VStack(alignment: .leading, spacing: 4) {
                    Text(role.displayName)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(role.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                
                Spacer()
                
                // Selection Indicator
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(isSelected ? Color(#colorLiteral(red: 0.31, green: 0.64, blue: 0.82, alpha: 1)) : Color(.systemGray4))
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: isSelected ? Color.blue.opacity(0.2) : Color.black.opacity(0.05),
                            radius: isSelected ? 8 : 4,
                            x: 0,
                            y: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? Color(#colorLiteral(red: 0.31, green: 0.64, blue: 0.82, alpha: 1)) : Color.clear, lineWidth: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    RoleCard(role:.coach, isSelected: false, action: { })
}
