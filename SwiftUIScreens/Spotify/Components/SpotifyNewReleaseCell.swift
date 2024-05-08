//
//  SpotifyNewReleaseCell.swift
//  SwiftUIScreens
//
//  Created by Mac on 30/03/2024.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName: String = Constants.imageURL
    var headline: String? = "New Release from"
    var subheadline: String? = "Some Artists"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single- title"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 10) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 60, height: 60)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 3) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    if let subheadline {
                        Text(subheadline)
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 150, height: 150)
                
                VStack(alignment: .leading, spacing: 40) {
                    VStack(alignment: .leading, spacing: 3) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }.font(.callout)
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(.spotifyDarkGray.opacity(0.001))
                            .onTapGesture {
                               onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                    }
                    
                }.padding(.trailing, 15)
            }
            .themeColors(isSelected: false)
            .cornerRadius(10)
            .onTapGesture {
                onPlayPressed?()
            }
            
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SpotifyNewReleaseCell().padding()
    }
}
