//
//  ItemView.swift
//  Memorize
//
//  Created by Pengfei Chen on 2/18/21.
//

import SwiftUI

struct ItemView: View {
    var theme: Theme
    @State var isEditing: Bool
    
    var emojiString: String
    
    init(_ theme: Theme, isEditing: Bool) {
        self.theme = theme
        emojiString = theme.emojis.joined()
        _isEditing = State(wrappedValue: isEditing)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(theme.name)
                .lineLimit(1)
                .truncationMode(.tail)
                .font(.title)
                .foregroundColor(isEditing ? Color.black : theme.foregroundColor())
            
            HStack {
                theme.numberOfCards == theme.numberOfPlayingCards ?
                    Text("All of")
                    : Text("\(theme.numberOfPlayingCards) pairs from")
                Text(emojiString)
                    .lineLimit(1)
                    .truncationMode(.tail)
                

            }
        }
    }
}

//struct ItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemView()
//    }
//}
