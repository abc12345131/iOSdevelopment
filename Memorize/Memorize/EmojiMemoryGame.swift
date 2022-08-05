//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Baolong Wu on 2022-07-26.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🌠", "🎇", "🌄", "🌇", "🚁", "🚦", "🚥", "🚧", "🗼", "⚓️", "🪝", "⛱", "🏟", "🎡", "🚢", "🛳", "🏠", "🛖", "🏚", "🏕", "🛟", "✈️", "🚀", "🛸", "📞", "📀", "📠", "📱", "🔦", "📡", "💡", "🔧", "🔨", "💎", "🪙", "💳"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10, createContent:  { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        })
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
