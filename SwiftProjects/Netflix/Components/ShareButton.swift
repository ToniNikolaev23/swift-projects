//
//  ShareButton.swift
//  SwiftProjects
//
//  Created by Toni Stoyanov on 3.02.25.
//

import SwiftUI

struct ShareButton: View {
    var url: String = "https://www.swiftful-thinking.com"
    
    @ViewBuilder
    var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack {
                    Image(systemName: "paperplane")
                    .font(.title)
                  
                    Text("Rate")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                }
                .foregroundStyle(.netflixWhite)
                .padding(8)
                .background(Color.black.opacity(0.001))
        }
       
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ShareButton()
    }
}
