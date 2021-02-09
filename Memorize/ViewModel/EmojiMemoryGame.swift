//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pengfei Chen on 11/20/20.
//

import SwiftUI

let emojis: Array<String> = ["👻","🎃", "🕸","🍫", "❤️"].shuffled()

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let numberOfPairsOfCards = theme.numberOfCards ?? Int.random(in: 2..<theme.emoji.count)
        let emoji = theme.emoji
        
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { emoji[$0] }
    }
    
    init() {
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    var theme = themes.randomElement()!
    
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
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}

