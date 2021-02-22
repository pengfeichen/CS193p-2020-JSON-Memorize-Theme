//
//  ColorChooserView.swift
//  Memorize
//
//  Created by Pengfei Chen on 2/22/21.
//

import SwiftUI

struct ColorChooserView: View {
    @EnvironmentObject var store : EmojiMemoryGameStore
    
    var theme: Theme
    
    let columns = [
        GridItem(.adaptive(minimum: 60))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(Theme.colors, id: \.self) { color in
                ZStack() {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(idealHeight: 60)
                        .foregroundColor(Theme.foregroundColor(color: color))
                        .gesture(tapToChangeColor(from: theme, to: color))
                    if theme.color == color {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.white)
                    }
                    
                }
                
            }
        }
        .padding()
    }
    
    private let cornerRadius: CGFloat = 10
    
    private func tapToChangeColor(from theme: Theme, to color: UIColor.RGB) -> some Gesture {
        TapGesture()
            .onEnded {
                if let themeIndex = store.themes.firstIndex(matching: theme) {
                    store.themes[themeIndex].color = color
                }
            }
    }
    
}
