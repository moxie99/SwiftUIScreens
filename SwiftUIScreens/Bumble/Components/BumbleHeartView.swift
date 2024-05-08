//
//  BumbleHeartView.swift
//  SwiftUIScreens
//
//  Created by Mac on 04/04/2024.
//

import SwiftUI

struct BumbleHeartView: View {
    var body: some View {
        ZStack {
            Circle().fill(.bumbleYellow).frame(width: 45, height: 45)
            
            Image(systemName: "bubble.fill").foregroundStyle(.bumbleBlack).font(.system(size: 24)).offset(y: 2)
            
            Image(systemName: "heart.fill").foregroundStyle(.bumbleYellow).font(.system(size: 12))
        }
    }
}

#Preview {
    BumbleHeartView()
}
