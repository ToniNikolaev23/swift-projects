//
//  NetflixMovieDetailsView.swift
//  SwiftProjects
//
//  Created by Toni Stoyanov on 2.02.25.
//

import SwiftUI
import SwiftfulRouting

struct NetflixMovieDetailsView: View {
    var product: Product = .mock
    
    @Environment(\.router) var router
    
    @State private var progress: Double = 0.2
    @State private var isMyList: Bool = false
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(
                    imageName: product.firstImage,
                    progress: progress) {
                        
                    } onXMarkPressed: {
                        router.dismissScreen()
                    }
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        detailsProductSection
                        
                        buttonsSection
                        
                        productsGridSection

                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)

            }
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        guard products.isEmpty else { return }
        
        do {
            products = try await DatabaseHelper().getProducts()
            
        } catch {
            print(error)
        }
    }
    
    private func onProductPressed(product: Product) {
        router.showScreen(.sheet) { _ in
            NetflixMovieDetailsView(product: product)
            
        }
    }
    
    private var detailsProductSection: some View {
        NetflixDetailsProductView(
            title: product.title,
            isNew: true,
            yearReleased: "2024",
            seasonCount: 4,
            hasClosedCaptions: true,
            isTopTen: 6,
            descriptionText: product.description,
            castText: "Cast: Toni, Your Name, Someone Else") {
                
            } onDownloadPressed: {
                
            }
    }
    
    private var buttonsSection: some View {
        HStack(spacing: 32) {
            MyListButton(
                isMyList: isMyList) {
                    isMyList.toggle()
                }
            
            RateButton { selection in
                
            }
            
            ShareButton()
        }
        .padding(.leading, 32)
    }
    
    private var productsGridSection: some View {
        VStack(alignment: .leading) {
            Text("More like this")
                .font(.headline)
            
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3),
                alignment: .center,
                spacing: 8,
                pinnedViews: []) {
                    ForEach(products) { product in
                        NetflixMovieCell(
                            imageName: product.firstImage,
                            title: product.title,
                            isRecentlyAdded: product.recentlyAdded,
                            topTenRanking: nil
                        )
                        .onTapGesture {
                            onProductPressed(product: product)
                        }
                    }
                }
            
        }
        .foregroundStyle(.netflixWhite)
    }
}

#Preview {
    RouterView { _ in
        NetflixMovieDetailsView()
    }
}
