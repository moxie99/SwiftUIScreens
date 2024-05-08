//
//  SwiftUIView.swift
//  SwiftUIScreens
//
//  Created by Mac on 27/03/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = Constants.imageURL
    var resizingMode: ContentMode = .fill
    var body: some View {
        Rectangle()
            .opacity(0.01)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            )
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
