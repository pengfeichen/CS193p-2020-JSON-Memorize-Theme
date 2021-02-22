//
//  CardCountView.swift
//  Memorize
//
//  Created by Pengfei Chen on 2/20/21.
//

import SwiftUI

struct CardCountView: View {
    @EnvironmentObject var store: EmojiMemoryGameStore
    @State private var numberOfPlayingCards: Int
    
    init(_ theme: Theme) {
        self.theme = theme
        _numberOfPlayingCards = State(wrappedValue: theme.numberOfPlayingCards)
    }

    var theme: Theme
    var body: some View {
        HStack {

            Text("\(theme.numberOfPlayingCards) Pairs")
                Spacer()
            
            Stepper(value: $numberOfPlayingCards, in: 2...theme.numberOfCards, step: 1, onEditingChanged: onCountChange) {EmptyView()}
           
            }
        }
    
    func onCountChange(_ didChange: Bool) {
        if let index = store.themes.firstIndex(matching: theme) {
            store.themes[index].numberOfPlayingCards = numberOfPlayingCards
    }
    }


//    func incrementCount() {
//        if theme.numberOfPlayingCards  < theme.numberOfCards {
//            if let index = store.themes.firstIndex(matching: theme) {
//                store.themes[index].numberOfPlayingCards += 1
//        }
//    }
//    }
//
//    func decrementCount() {
//        if theme.numberOfPlayingCards > 2 {
//            if let index = store.themes.firstIndex(matching: theme) {
//                store.themes[index].numberOfPlayingCards -= 1
//        }
//    }
//    }
    
    }

