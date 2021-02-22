//
//  ContentView.swift
//  Memorize
//
//  Created by Pengfei Chen on 11/16/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{

            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.75)){
                        viewModel.choose(card:card)
                    }
                }
                .padding(5)
            }
            .foregroundColor(viewModel.theme.foregroundColor())
            
            Button("New Game") {
                withAnimation(.easeInOut){
                    viewModel.newGame()
                }
            }
            .padding()
            
        }
            .padding()
            .navigationTitle(viewModel.theme.name)
            .navigationBarItems(trailing: Text("Current Score: \(viewModel.score)"))
        

}



struct CardView: View {
    var card: MemoryGame<String>.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = -card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    var body: some View {
        GeometryReader{ geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack {
                    Group{
                        if card.isConsumingBonusTime {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(animatedBonusRemaining * 360 - 90 ), clockwise: true)
                                .onAppear {
                                    startBonusTimeAnimation()
                                }
                        } else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining * 360 - 90 ), clockwise: true)
                        }
                    }
                    .padding(5).opacity(0.4)
                    
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(.scale)
            }
        }
    }
    
    // MARK: - Drawing Constants
    let fontScaleFactor: CGFloat = 0.7
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}
}
