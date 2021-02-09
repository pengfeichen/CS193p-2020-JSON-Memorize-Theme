//
//  Theme.swift
//  Memorize
//
//  Created by Pengfei Chen on 1/14/21.
//
import SwiftUI

struct Theme: Codable {
    var name: String
    var emoji: [String]
    var color: UIColor.RGB
    var numberOfCards: Int
    
    func foregroundColor() -> Color {
        Color(self.color)
    }
}

let themes: [Theme] = [
    Theme(name: "Animals", emoji: ["🐱","🐶","🐼","🐮","🐸","🦊"], color: UIColor(.green).rgb, numberOfCards: 4),
    Theme(name: "Sports", emoji: ["⚽️","🏀","🏈","⚾️","🎾","🏐"], color: UIColor(.blue).rgb, numberOfCards: 4),
    Theme(name: "Faces", emoji: ["😯","😬","🤭","🤗","🤤","🙄"], color: UIColor(.yellow).rgb, numberOfCards: 4),
    Theme(name: "Flags", emoji: ["🇨🇳","🇺🇸","🇸🇬","🇯🇵","🇰🇷","🇦🇺"], color: UIColor(.gray).rgb,numberOfCards: 6),
    Theme(name: "Food", emoji: ["🥦","🌽","🌶","🧄","🧀","🍔"], color: UIColor(.red).rgb, numberOfCards: 4),
    Theme(name: "Halloween", emoji: ["👻","🎃", "🕸","🍫", "❤️"], color: UIColor(.orange).rgb, numberOfCards: 5)
]
