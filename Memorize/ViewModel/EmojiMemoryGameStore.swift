//
//  EmojiMemoryGameStore.swift
//  Memorize
//
//  Created by Pengfei Chen on 2/17/21.
//

import SwiftUI
import Combine

class EmojiMemoryGameStore: ObservableObject {
    
    let name: String
    
    @Published var themes = [Theme]()
    
    // hook up the autosave to subscribe to any changes to the emojiThemes array.
    private var autosave: AnyCancellable?
    
    init(named name: String = "Memorize") {
        self.name = name
        // create keyname for the theme to be stored inside Userdefaults
        let defaultsKey = "EmojiMemoryGameStore.\(name)"
        
        // MARK - Refactor later
        if let json = UserDefaults.standard.data(forKey: defaultsKey) {
            themes = try! JSONDecoder().decode([Theme].self, from: json)
        }
        
        autosave = $themes.sink { theme in
            UserDefaults.standard.setValue(theme.json, forKey: defaultsKey)
        }
    }
    
    
    func addTheme(named name: String = "Untitled") {
        let theme = Theme.themes.randomElement()!
        themes.append(Theme(
                        name: "Untitled",
                        emojis: theme.emojis,
                        color: theme.color, numberOfPlayingCards: theme.numberOfPlayingCards))
    }
    
    func removeTheme(_ theme: Theme) {
        if let removeIndex = themes.firstIndex(matching: theme) {
            themes.remove(at: removeIndex)
        }
    }
    
    func changeThemeName(_ theme: Theme, to name: String) {
        if let index = themes.firstIndex(matching: theme) {
            themes[index].name = name
        }
    }
    
    func addEmojiToTheme(_ theme: Theme, with emoji: String) {
        if let index = themes.firstIndex(matching: theme) {
            for emoji in emoji {
                if emoji != " ", !themes[index].emojis.contains(String(emoji)) {
                    themes[index].emojis.append(String(emoji))
                    if let emojiIndex = themes[index].removedEmojis.firstIndex(of:String(emoji)) {
                        themes[index].removedEmojis.remove(at: emojiIndex)
                    }
                }
            }
        }
    }
    
    func removeEmojiFromTheme(from theme: Theme, with emoji: String) {
        if theme.numberOfCards > 2{
        if let index = themes.firstIndex(matching: theme) {
            if let emojiFoundIndex = themes[index].emojis.firstIndex(of: emoji) {
                themes[index].emojis.remove(at: emojiFoundIndex)
                if !themes[index].removedEmojis.contains(emoji) {
                    themes[index].removedEmojis.append(emoji)
                }
            }
        }}
    }
}
