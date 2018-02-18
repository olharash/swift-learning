//
//  Concentration.swift
//  Concetration
//
//  Created by Olga on 2/17/18.
//  Copyright © 2018 olharash. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()

    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        //3 cases:1)no cards, 2)2 cards are face up, 3)1 card is face up
        //check 3) case
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                indexOfOneAndOnlyFaceUpCard = nil
                cards[index].isFaceUp = true
            } else{
                //either no cards or 2 cards are face up
                for flipdownIndex in cards.indices{
                    cards[flipdownIndex].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = index
                cards[index].isFaceUp = true
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
            // TODO: Shuffle the cards
            
        }
    }
}
