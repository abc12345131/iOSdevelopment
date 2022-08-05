//
//  ContentView.swift
//  Memorize
//
//  Created by Baolong Wu on 2022-07-25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards) { card in CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                        
                    }
                }
                .foregroundColor(.red)
                Spacer()
                HStack {
                    remove
                    Spacer()
                    add
                }
                .font(.largeTitle)
                .padding(.horizontal)
            }
            .padding(.horizontal)
        }
    }
    
    var remove: some View {
        Button (
            action: {
//                if emojiCount>1 {
//                    emojiCount -= 1
//                }
            },
            label: {
                Image(systemName: "minus.circle")
            }
        )
    }
    
    var add: some View {
        Button (
            action: {
//                if emojiCount<emojis.count {
//                    emojiCount += 1
//                }
            },
            label: {
                Image(systemName: "plus.circle")
            }
        )
    }
            
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .previewInterfaceOrientation(.portrait)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
