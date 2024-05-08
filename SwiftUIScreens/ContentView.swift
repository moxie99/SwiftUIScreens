//
//  ContentView.swift
//  SwiftUIScreens
//
//  Created by Mac on 27/03/2024.
//

import SwiftUI
import SwiftfulRouting

struct ContentView: View {
    @Environment(\.router) var router
    var body: some View {
        
        List {
            Button("Open Spotify") {
                router.showScreen(.fullScreenCover) { _ in
                    SpotifyHomeView()
                }
            }
        }
    }
}




#Preview {
    RouterView { _ in
        ContentView()
    }
}
