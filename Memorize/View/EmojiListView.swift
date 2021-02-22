//
//  EmojiListView.swift
//  Memorize
//
//  Created by Pengfei Chen on 2/19/21.
//

import SwiftUI

struct EmojiListView: View {
    @EnvironmentObject var store : EmojiMemoryGameStore
    
    var theme: Theme
    
    let columns = [
        GridItem(.adaptive(minimum: 60))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(theme.emojis, id: \.self) { emoji in
                Text(emoji).font(.largeTitle)
                    .gesture(doubleTapToRemove(from: theme, with: emoji))
            }
        }
        .padding()
    }
    
    private func doubleTapToRemove(from theme: Theme, with emoji: String) -> some Gesture {
        TapGesture()
            .onEnded {
                withAnimation(.linear){

                store.removeEmojiFromTheme(from: theme, with: emoji)
                }
            }
        }
    }


