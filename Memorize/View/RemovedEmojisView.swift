//
//  RemovedEmojisView.swift
//  Memorize
//
//  Created by Pengfei Chen on 2/22/21.
//

import SwiftUI

struct RemovedEmojisView: View {
    @EnvironmentObject var store : EmojiMemoryGameStore
    
    var theme: Theme
    
    let columns = [
        GridItem(.adaptive(minimum: 60))
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(theme.removedEmojis, id: \.self) { emoji in
                Text(emoji).font(.largeTitle)
                    .gesture(
                        tapToAddEmoji(to: theme, with: emoji)
                        
                    )

            }
        }
        .padding()
    }
    
    private func tapToAddEmoji(to theme: Theme, with emoji: String) -> some Gesture {
        TapGesture()
            .onEnded {
                withAnimation(.linear){

                store.addEmojiToTheme(theme, with: emoji)
                }
        }
    }
}
