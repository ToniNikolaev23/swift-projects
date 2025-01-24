//
//  SwiftProjectsApp.swift
//  SwiftProjects
//
//  Created by Toni Stoyanov on 20.01.25.
//

import SwiftUI
import SwiftfulRouting

@main
struct SwiftProjectsApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
            
        }
    }
}
