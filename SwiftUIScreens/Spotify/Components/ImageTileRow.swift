//
//  ImageTileRow.swift
//  SwiftUIScreens
//
//  Created by Mac on 30/03/2024.
//

import SwiftUI

struct ImageTileRow: View {
    var imageSize: CGFloat = 100
    var imageName: String = Constants.imageURL
    var title: String = "Iphone XR"
    
    var body: some View {
        
        VStack {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
                
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(4)
        }.frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ImageTileRow()
    }
}
