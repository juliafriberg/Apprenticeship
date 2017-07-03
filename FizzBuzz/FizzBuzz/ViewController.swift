//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Julia Friberg on 2017-06-19.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game?
    
    var gameScore: Int? {
        didSet {
            guard let unwrappedGameScore = gameScore else {
                print("Game score is nil")
                return
            }
            numberButton.setTitle("\(unwrappedGameScore)", for: .normal)
        }
    }

    @IBOutlet weak var numberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = Game()
        
        guard let checkedGame = game else {
            print("Game is nil")
            return
        }
        
        gameScore = checkedGame.score
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func play(move: Move) {
        
        guard let unwrappedGame = game else {
            print("Game nil")
            return
        }
        let response = unwrappedGame.play(move: move)
        gameScore = response.score
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let identifier = sender.accessibilityIdentifier else {
            print("no identifier")
            return
        }
        
        switch identifier {
        case "numberButton":
            play(move: .number)
        case "fizzButton":
            play(move: .fizz)
        case "buzzButton":
            play(move: .buzz)
        case "fizzBuzzButton":
            play(move: .fizzBuzz)
        default: break
            
        }
    }

}

