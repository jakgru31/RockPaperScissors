//
//  ContentView.swift
//  RockPaperScisors
//
//  Created by Jakub Gruszka on 29/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var playerChoice: String = ""
    @State private var AIChoice: String = ""
    @State private var result: String = ""
    
    private let game = GameFunctionality()
    
    var body: some View {
            VStack(spacing: 20) {
                Text("Rock-Paper-Scissors")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                VStack(alignment: .leading, spacing:20){
                    Text("Your Choice: \(emoji(for: playerChoice))").font(.system(size: 30))
                    Text("Computer Choice: \(emoji(for: AIChoice))").font(.system(size: 30))}
                    Text("Result: \(result)")
                        .font(.title2)
                        .foregroundColor(result == "You Win!" ? .green : (result == "You Lose!" ? .red : .blue)).font(.system(size: 40))
                
                Spacer()
                
                HStack(spacing: 30) {
                    ForEach(game.choices, id: \.self) { choice in
                        Button(action: {
                            play(choice)
                        }) {
                            Text(emoji(for: choice))
                                .font(.system(size: 75)).frame(width: 100, height: 100)
                                .background(Color.blue.opacity(0.2))
                                .clipShape(Circle())
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        
        func play(_ userSelection: String) {
            playerChoice = userSelection
            AIChoice = game.AIChoice()
            result = game.isWinner(player: playerChoice, AI: AIChoice)
        }
    func emoji(for choice: String) -> String {
        switch choice{
            case "Rock": return "✊"
            case "Paper": return "✋"
            case "Scissors": return "✌️"
            default: return ""
        }
        
    }
}

#Preview {
    ContentView()
}
