//
//  AddEmojiView.swift
//  Memorize
//
//  Created by Pengfei Chen on 2/19/21.
//

import SwiftUI

struct AddEmojiView: View {
    var theme: Theme

    @State private var editableText = ""
    @EnvironmentObject var store: EmojiMemoryGameStore
    var body: some View {
            HStack {
                TextField("Emoji", text: $editableText).keyboardType(.twitter)


                Spacer()
                Button("Add") {
                    store.addEmojiToTheme(theme, with: editableText)
                    editableText = ""
                }
            }
        }
    
}
