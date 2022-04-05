//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ives Murillo on 4/1/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            MemoryGameView(viewModel: game)
        }
    }
}
