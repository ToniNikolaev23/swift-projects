//
//  NetflixMovieDetailsView.swift
//  SwiftProjects
//
//  Created by Toni Stoyanov on 2.02.25.
//

import SwiftUI

struct NetflixMovieDetailsView: View {
    var product: Product = .mock
    
    @State private var progress: Double = 0.2
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(
                    imageName: product.firstImage,
                    progress: progress) {
                        
                    } onXMarkPressed: {
                        
                    }
                
                ScrollView(.vertical) {
                    VStack(spacing: 16) {
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
                    .padding(8)
                }
                .scrollIndicators(.hidden)

            }
        }
    }
}

#Preview {
    NetflixMovieDetailsView()
}
