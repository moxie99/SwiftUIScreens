//
//  BumbleHomeView.swift
//  SwiftUIScreens
//
//  Created by Mac on 02/04/2024.
//

import SwiftUI
import SwiftfulUI
struct BumbleHomeView: View {
    @State private var filters: [String] = ["Everyone", "Trending"]
    @AppStorage("bumble_home_filter") private var selectedFilter = "Everyone"
    @State private var allUsers: [User] = []
    @State private var selectedIndex: Int = 0
    @State private var cardOffset: [Int: Bool] = [:]
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 8) {
                header
                BumbleFilterView(options: filters, selection: $selectedFilter)
                    .background(Divider(), alignment: .bottom)
//                BumbleCardView()
                
                ZStack {
                    if !allUsers.isEmpty {
                        ForEach(Array(allUsers.enumerated()), id: \.offset) { (index, user) in
                            
                            let isPrevious = (selectedIndex - 1) == index
                            let isCurrent = selectedIndex == index
                            let isNext = (selectedIndex + 1) == index
                            
                            if isPrevious || isCurrent || isNext {
                                let offsetValue = cardOffset[user.id]
                                Rectangle()
                                    .fill(index == 0 ? Color.red : Color.blue)
                                    .overlay(Text("\(index)"))
                                
                                    .withDragGesture(
                                    .horizontal,
                                    minimumDistance: 0,
                                    resets: true,
                                    animation: .easeInOut,
                                    rotationMultiplier: 1.05,
                                    scaleMultiplier: 0.8,
                                    onChanged: {dragOffset in
                                        
                                    },
                                    onEnded: { dragOffset in
                                        
                                        if dragOffset.width < -50 {
                                            userDidSelect(index: index, isLike: false)
                                        } else if dragOffset.width > 50 {
                                            userDidSelect(index: index, isLike: true)
                                        }
                                    }
                                )
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                            }
                            
                        }
                    } else {
                        ProgressView()
                    }
                }.frame(maxWidth: .infinity).animation(.smooth, value: cardOffset)
                
            }.padding(8)
        }
        .task {
            await getAllUsers()
        }.toolbar(.hidden, for: .navigationBar)
    }
    
    private func userDidSelect(index: Int, isLike: Bool ) {
        let user = allUsers[index]
        cardOffset[user.id] = isLike
        selectedIndex += 1
    }
    private func getAllUsers() async {
        guard  allUsers.isEmpty else {return}
        do {
            allUsers = try await DatabaseHelper().getUsers()
        }catch {
            
        }
    }
    private var header: some View  {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
            }.frame(maxWidth: .infinity, alignment: .leading)
            Text("Bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .onTapGesture {
                    
                }
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }

}


#Preview {
    BumbleHomeView()
}
