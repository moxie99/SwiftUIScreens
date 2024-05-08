//
//  PlaylistHeaderCell.swift
//  SwiftUIScreens
//
//  Created by Mac on 01/04/2024.
//

import SwiftUI
import SwiftfulUI
struct PlaylistHeaderCell: View {
    var height: CGFloat = 300
    var title: String = "Some playlist title here"
    var subtitles: String = "Subtitle goes here"
    var imageName: String = Constants.imageURL
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(ImageLoaderView(urlString: imageName))
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitles)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                    .foregroundStyle(.spotifyWhite)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                    )
                    
                , alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            
            PlaylistHeaderCell()
        }.ignoresSafeArea()
    }
}
