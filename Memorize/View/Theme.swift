//
//  Theme.swift
//  Memorize
//
//  Created by Pengfei Chen on 1/14/21.
//
import SwiftUI

struct Theme {
    var name: String
    var emoji: [String]
    var color: Color
    var numberOfCards: Int?
}

let themes: [Theme] = [
Theme(name: "Animals", emoji: ["🐱","🐶","🐼","🐮","🐸","🦊"], color: .green, numberOfCards: 4),

Theme(name: "Sports", emoji: ["⚽️","🏀","🏈","⚾️","🎾","🏐"], color: .blue, numberOfCards: 4),

Theme(name: "Faces", emoji: ["😯","😬","🤭","🤗","🤤","🙄"], color: .yellow, numberOfCards: 4),

Theme(name: "Flags", emoji: ["🇨🇳","🇺🇸","🇸🇬","🇯🇵","🇰🇷","🇦🇺"], color: .gray),

Theme(name: "Food", emoji: ["🥦","🌽","🌶","🧄","🧀","🍔"], color: .red, numberOfCards: 4),

Theme(name: "Halloween", emoji: ["👻","🎃", "🕸","🍫", "❤️"], color: .orange)]
