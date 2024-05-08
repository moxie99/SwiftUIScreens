//
//  BumbleCardView.swift
//  SwiftUIScreens
//
//  Created by Mac on 04/04/2024.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    var user: User = .mock
    var onFloatingButtonPress: (()-> Void)? = nil
    var onXButtonPress: (()-> Void)? = nil
    var onCheckedButtonPress: (()-> Void)? = nil
    var onSecondComplimentButtonPress: (()-> Void)? = nil
    var onHideAndReportButtonPress: (()-> Void)? = nil
    
    @State private var cardFrame: CGRect = .zero
    var body: some View {
        
        ScrollView(.vertical) {
            
            LazyVStack(spacing: 0) {
                headerCell
                    .frame(height: cardFrame.height)
                aboutMe
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                myIterestSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                ForEach(user.images, id: \.self) {image in
                    ImageLoaderView(urlString: image)
                        .frame(height: cardFrame.height)
                }
                location
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                
                footer
                    .padding(.top, 60)
                    .padding(.bottom, 60)
                    .padding(.horizontal, 32)
                
                
            }
        }
        .scrollIndicators(.hidden)
        .overlay (
            floatingButton
                .padding(24)
            
            ,alignment: .bottomTrailing
        )
        .background(.bumbleLightYellow)
        .cornerRadius(35)
        .readingFrame { frame in
            cardFrame = frame
        }
    }
    
    private func sectionTitle(title: String) -> some View {
        Text(title).font(.body).foregroundStyle(.bumbleGray)
    }
    
    private var floatingButton: some View {
        Image(systemName: "hexagon.fill")
            .foregroundStyle(.bumbleYellow)
            .font(.system(size: 60))
            .overlay(
                Image(systemName: "star.fill")
                    .foregroundStyle(.bumbleBlack)
                    .font(.system(size: 30, weight: .medium))
            )
            .onTapGesture {
                onFloatingButtonPress?()
            }
       
    }
    private var headerCell: some View {
        ZStack(alignment: .bottomLeading) {
            ImageLoaderView(urlString: user.image)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4) {
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                BumbleHeartView()
                    .onTapGesture {
                    
                }
            }.padding(
                25
            ).font(
                .callout
            ).fontWeight(
                .medium
            ).foregroundStyle(
                .bumbleWhite
            ).frame(
                maxWidth: .infinity,
                alignment: .leading
            ).background(LinearGradient(colors: [.bumbleBlack.opacity(0), .bumbleBlack.opacity(0.6), .bumbleBlack.opacity(0.6)], startPoint: .top, endPoint: .bottom))
        }
    }
    
    private var location: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text(user.firstName + "'s Location")
            }.foregroundStyle(.bumbleGray).font(.body).fontWeight(.medium)
            
            Text("10 miles away").font(.headline).foregroundStyle(.bumbleBlack)
            InterestPillView(iconName: nil, emoji: "🇺🇸", text: "Lives in New York, NY")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    private var aboutMe: some View {
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            sectionTitle(
                title: "About Me"
            )
            Text(
                user.aboutMe
            ).font(
                .body
            ).fontWeight(
                .semibold
            ).foregroundStyle(
                .bumbleBlack
            )
            HStack {
                BumbleHeartView()
                
                Text(
                    "Send a compliment"
                ).font(
                    .caption
                ).fontWeight(
                    .semibold
                )
                
            }.padding(
                [
                    .horizontal,
                    .trailing
                ],
                8
            ).background(
                .bumbleYellow
            ).cornerRadius(
                32
            ).onTapGesture {
                onSecondComplimentButtonPress?()
            }
            
        }.frame(
            maxWidth:  .infinity,
            alignment: .leading
        )
    }
    
    private var myIterestSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My Interests")
                InterestPillGridView(interests: user.basics)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My Basics")
                InterestPillGridView(interests: user.interests)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var footer: some View {
        VStack(spacing: 24) {
            HStack(spacing: 0) {
                Circle().fill(.bumbleYellow)
                    .overlay(
                        Image(systemName: "xmark")
                            .font(.title).fontWeight(.semibold)
                    )
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onXButtonPress?()
                    }
                
                Spacer(minLength: 0)
                
                Circle().fill(.bumbleYellow)
                    .overlay(
                        Image(systemName: "checkmark")
                            .font(.title).fontWeight(.semibold)
                    )
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onCheckedButtonPress?()
                    }
            }
            
            Text("Hide and Report")
                .font(.headline)
                .foregroundStyle(.bumbleGray)
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onHideAndReportButtonPress?()
                }
        }
    }
}

#Preview {
    BumbleCardView().padding()
}
