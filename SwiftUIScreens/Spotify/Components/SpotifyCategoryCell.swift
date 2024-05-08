//
//  SpotifyCategoryCell.swift
//  SwiftUIScreens
//
//  Created by Mac on 27/03/2024.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "All"
    var isSelected: Bool = false
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .themeColors(isSelected: isSelected)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

extension View {
    func themeColors(isSelected: Bool) -> some View {
        self
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .background(isSelected ? .spotifyGreen : .spotifyGray)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            SpotifyCategoryCell(title: "Title is here")
            SpotifyCategoryCell(title: "Title is here 2", isSelected: true)
            SpotifyCategoryCell(title: "Title is here 34", isSelected: true)
        }
    }
}
