//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ives Murillo on 4/3/22.
//

import Foundation



class EmojiMemoryGame: ObservableObject {
   
    static let emojis = ["🚀","🚖","🛳","🚁","🚲","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛴","🛵","🏍","🛺","🚔","🚍","🛸","🚂"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
       
        model.choose(card)
    }
}
