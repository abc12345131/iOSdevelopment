//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Baolong Wu on 2022-07-26.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🌠", "🎇", "🌄", "🌇", "🚁", "🚦", "🚥", "🚧", "🗼", "⚓️", "🪝", "⛱", "🏟", "🎡", "🚢", "🛳", "🏠", "🛖", "🏚", "🏕", "🛟", "✈️", "🚀", "🛸", "📞", "📀", "📠", "📱", "🔦", "📡", "💡", "🔧", "🔨", "💎", "🪙", "💳"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10, createContent:  { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        })
    }
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
