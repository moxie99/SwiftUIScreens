//
//  InterestPillGridView.swift
//  SwiftUIScreens
//
//  Created by Mac on 04/04/2024.
//

import SwiftUI
import SwiftfulUI

struct UserInterest: Identifiable {
    let id = UUID().uuidString
    var iconame: String? = nil
    var emoji:  String? = nil
    var text: String
}

struct InterestPillGridView: View {
    var interests: [UserInterest] = User.mock.interests
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interests) { interest in
                if let interest {
                    InterestPillView(
                        iconName: interest.iconame,
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
        InterestPillGridView(interests: User.mock.interests )
        InterestPillGridView(interests: User.mock.basics)
    }
}
