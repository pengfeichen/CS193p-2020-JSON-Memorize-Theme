//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Pengfei Chen on 11/16/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var store = EmojiMemoryGameStore()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameChooser().environmentObject(store)
        }
    }
}
