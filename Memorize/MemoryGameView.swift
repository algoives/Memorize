//
//  ContentView.swift
//  Memorize
//
//  Created by Ives Murillo on 4/1/22.
//

import SwiftUI

struct MemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                    ForEach(viewModel.cards) { card in
                           CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                    }
                }
                       
            }
    }
        .foregroundColor(.blue)
        .padding(.horizontal)
        
    }
 }


struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            let shape: RoundedRectangle =  RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
            
                 shape.fill().foregroundColor(.white)
                 
                 shape.stroke(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
               shape.fill()
                
            }
        }
       
        
    }
}



struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        MemoryGameView(viewModel: game)
            .preferredColorScheme(.dark)
        MemoryGameView(viewModel: game)
            .preferredColorScheme(.light)
    }
}

