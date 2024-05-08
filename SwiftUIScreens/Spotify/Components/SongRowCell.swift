//
//  SongRowCell.swift
//  SwiftUIScreens
//
//  Created by Mac on 01/04/2024.
//

import SwiftUI

struct SongRowCell: View {
    var imageSize: CGFloat = 60
    var imageName: String = Constants.imageURL
    var title: String = "Some Songs here"
    var subtitle: String? = "Some artists here"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                        
                }
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(
                systemName: "ellipsis"
            ).font(
                .subheadline
            ).foregroundStyle(
                .spotifyWhite
            ).padding(
                16
            ).background(
                Color.black.opacity(
                    0.001
                )
            ).onTapGesture {
                onEllipsisPressed?()
            }
        }
        .foregroundStyle(.red)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}
