//
//  ThemeEditorView.swift
//  Memorize
//
//  Created by Pengfei Chen on 2/18/21.
//

import SwiftUI

struct ThemeEditorView: View {
    
    var theme: Theme?
    @Binding var isShowing : Bool
    @Binding var editMode: EditMode

    @EnvironmentObject var store: EmojiMemoryGameStore
    
    var chosenTheme: Theme? {
        if let theme = theme {
            if let index = store.themes.firstIndex(matching: theme) {
             return store.themes[index]
        }
        }
        return nil
    }
    
    var themeName: String {
        if let theme = chosenTheme {
            return theme.name
        } else {
            return ""
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {

            Divider()
            Form {
                if let theme = chosenTheme {
                    Section {
                        ThemeNameView(theme: theme)
                    }
                    Section (header: Text("Add emoji")) {
                        AddEmojiView(theme: theme)
                    }
                    Section(header: Text("Emojis")) {
                        EmojiListView(theme: theme)
                    }
                    Section(header: Text("Card Count")) {
                        CardCountView(theme)
                    }
                    Section(header: Text("Color")) {
                        ColorChooserView(theme: theme)
                    }
                    if let theme = chosenTheme {
                        if theme.removedEmojis.count > 0 {
                            Section(header: Text("Removed Emojis")) {
                                RemovedEmojisView(theme: theme)
                            }
                        }
                    }
                
                }

            }
            }                .navigationTitle(themeName).navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                                                    isShowing = false
                editMode = .inactive
            }) { Text("Done") })
        }
        .navigationBarHidden(true)
            
            
        

    }
    
}
