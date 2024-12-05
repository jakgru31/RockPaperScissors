//
//  GameFunctionality.swift
//  RockPaperScisors
//
//  Created by Jakub Gruszka on 29/11/2024.
//

import Foundation

struct GameFunctionality{
    let choices = ["Rock", "Paper", "Scissors"]
    
    func AIChoice() -> String{
        return choices.randomElement() ?? "Rock"
    }
    func isWinner(player: String, AI: String) -> String{
        if player == AI{
            return "Draw"
        }
        switch(player, AI){
            case ("Scissors", "Paper"), ("Paper", "Rock"), ("Rock", "Scissors"):
            return "You won"
        default:
            return "You lost"
            
        }
    }
}
