//
//  SpotifyHomeView.swift
//  SwiftUIScreens
//
//  Created by Mac on 27/03/2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyHomeView: View {
    @Environment(\.router) var router
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        VStack(spacing: 20) {
                            recent
                            if let product = products.first {
                                newRelease(product: product)
                            }
                            
                        }.padding(.horizontal, 10)
                       
                        listRow
                    } header: {
                        header
                    }
                })
            }.scrollIndicators(.hidden).clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        guard products.isEmpty else {return}
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProduct().prefix(10))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({$0.brand}))
            for brand in allBrands {
//                let products = self.products.filter({$0.brand == brand})
                rows.append(ProductRow(tile: brand.capitalized, products: products))
            }
            productRows = rows
        } catch {
            
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .scaledToFill()
                        .onTapGesture {
                            router.dismissScreen()
                        }
                }
            }.frame(width: 35, height: 35)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized, isSelected: selectedCategory == category)
                            .onTapGesture {
                            selectedCategory = category
                        }
                    }
                    
                }.padding(.horizontal, 20)
            }
            .scrollIndicators(.hidden)
        }.padding(.vertical, 24).padding(.leading, 8).background(Color.spotifyBlack)
    }
    
    private var recent: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentsCell(imageName: product.firstImage, title: product.title)
                    .asButton(.press) {
                        goToPlayList(product: product)
                    }
            }
        }
    }
    
    private func goToPlayList(product: Product) {
        guard let currentUser else {return}
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: currentUser)
        }
    }
    
    private func newRelease(product: Product) ->  some View {
        SpotifyNewReleaseCell(imageName: product.firstImage, headline: product.title, subheadline: product.description,title: product.category, subtitle: product.brand,
        onAddToPlaylistPressed: {
            
        },onPlayPressed: {
            goToPlayList(product: product)
        }
        )
    }
    
    private var listRow: some View {
        ForEach(productRows) { row in
            VStack(spacing: 10) {
                Text(row.tile)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment:.leading)
            }
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 15) {
                    ForEach(row.products) {product in
                        ImageTileRow(imageSize: 130, imageName: product.firstImage, title: product.title)
                            .asButton(.press) {
                                goToPlayList(product: product)
                            }
                    }
                }
                
            }.scrollIndicators(.hidden)
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyHomeView()
    }
}
