//
//  InterestedPillGridView.swift
//  SwiftProjects
//
//  Created by Toni Stoyanov on 26.01.25.
//

import SwiftUI
import SwiftfulUI

struct UserInterest: Identifiable {
    let id = UUID().uuidString
    var iconName: String? = nil
    var emoji: String? = nil
    var text: String
}

struct InterestedPillGridView: View {
    var interests: [UserInterest] = User.mock.basics
    var body: some View {
        ZStack {
            NonLazyVGrid(
                columns: 2,
                alignment: .leading,
                spacing: 8,
                items: interests
            ) { interest in
                if let interest {
                    InterestedPillView(
                        iconName: interest.iconName,
                        emoji: interest.emoji,
                        text: interest.text
                    )
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 40) {
        InterestedPillGridView(interests: User.mock.basics)
        InterestedPillGridView(interests: User.mock.interests)
    }
}
