//
//  Theme.swift
//  Memorize
//
//  Created by Pengfei Chen on 1/14/21.
//
import SwiftUI

struct Theme: Codable, Identifiable, Hashable {
    var name: String
    var emojis: [String] {
        didSet {
            if numberOfPlayingCards > numberOfCards {
                numberOfPlayingCards = numberOfCards
            }
        }
    }
    var color: UIColor.RGB
    
    var numberOfCards: Int {
        emojis.count
    }
    
    var removedEmojis = [String]()
    
    var numberOfPlayingCards: Int
    
    // Conform to Identifiable
    var id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func foregroundColor() -> Color {
        Color(self.color)
    }
    
    static func foregroundColor(color: UIColor.RGB) -> Color {
        Color(color)
    }
    
    var json: Data? {
         try? JSONEncoder().encode(self)
    }
    
    static let colors: [UIColor.RGB] = [
        UIColor(.purple).rgb,
        UIColor(.red).rgb,
        UIColor(.blue).rgb,
        UIColor(.gray).rgb,
        UIColor(.green).rgb,
        UIColor(.orange).rgb
        
    ]
    
    static let themes: [Theme] = [
        Theme(name: "Animals", emojis: ["🐸","🦊"], color: UIColor(.green).rgb, numberOfPlayingCards: 2),
        Theme(name: "Sports", emojis: ["🏈","🎾"], color: UIColor(.blue).rgb, numberOfPlayingCards: 2),
        Theme(name: "Faces", emojis: ["😯","😬"], color: UIColor(.yellow).rgb, numberOfPlayingCards: 2),
        Theme(name: "Flags", emojis: ["🇨🇳","🇺🇸"], color: UIColor(.gray).rgb, numberOfPlayingCards: 2),
        Theme(name: "Food", emojis: ["🧀","🍔"], color: UIColor(.red).rgb, numberOfPlayingCards: 2),
        Theme(name: "Halloween", emojis: ["🍫", "❤️"], color: UIColor(.orange).rgb, numberOfPlayingCards: 2)
    ]
}


