//
//  Game.swift
//  FizzBuzz
//
//  Created by Julia Friberg on 2017-06-19.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import Foundation

class Game {
    
    let brain = Brain()
    
    var score: Int
    
    init() {
        score = 0
    }
    
    func play(move: Move) -> (right: Bool, score: Int) {
        
        if brain.check(number: score+1) == move {
            score += 1
            return (true, score)
        } else {
            return (false, score)
        }
    }
    
}
