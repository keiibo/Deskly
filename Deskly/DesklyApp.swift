//
//  DesklyApp.swift
//  Deskly
//
//  Created by Keita Kobayashi on 2025/01/12.
//

import SwiftUI

@main
struct DesklyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.font, Font.custom("Roboto-Bold", size: 16))

        }
    }
}
