//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pengfei Chen on 11/20/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        
        if let data = theme.json {
            if let result = data.utf8 {
                print(result)
            }
        }
        
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPlayingCards) { theme.emojis[$0] }
    }
    
    // Create EmojiMemory game with the theme chosen by user
    init(with theme: Theme) {
        model = EmojiMemoryGame.createMemoryGame(with: theme)
        self.theme = theme
    }
    
    var theme: Theme
        
    var score: Int {
        model.score
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}

