//
//  NetflixHomeView.swift
//  SwiftProjects
//
//  Created by Toni Stoyanov on 30.01.25.
//

import SwiftUI

struct NetflixHomeView: View {
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
                Spacer()
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For you")
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
        }
    }
}

#Preview {
    NetflixHomeView()
}
