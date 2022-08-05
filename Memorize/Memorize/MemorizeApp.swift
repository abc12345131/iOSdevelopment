//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Baolong Wu on 2022-07-25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
