//
//  InterestedPillView.swift
//  SwiftProjects
//
//  Created by Toni Stoyanov on 26.01.25.
//

import SwiftUI

struct InterestedPillView: View {
    var iconName: String? = "heart.fill"
    var emoji: String? = "💼"
    var text: String = "Graduate Degree"
    var body: some View {
        HStack(spacing: 4) {
            if let iconName {
                Image(systemName: iconName)
            } else if let emoji {
                Text(emoji)
            }
            
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleLightYellow)
        .cornerRadius(32)
    }
}

#Preview {
    VStack {
        InterestedPillView(iconName: nil)
        InterestedPillView()
    }
}
