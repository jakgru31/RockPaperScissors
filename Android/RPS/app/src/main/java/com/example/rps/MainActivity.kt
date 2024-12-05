package com.example.rps

import android.os.Bundle
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        val welcomeView = findViewById<TextView>(R.id.welcomeTV)
        welcomeView.text = "Rock-Paper-Scissors!"

        val rockButton = findViewById<TextView>(R.id.buttonRock)
        rockButton.text = "✊"
        rockButton.setOnClickListener {
            playGame("Rock")
        }

        val paperButton = findViewById<TextView>(R.id.buttonPaper)
        paperButton.text = "✋"
        paperButton.setOnClickListener {
            playGame("Paper")
        }

        val scissorsButton = findViewById<TextView>(R.id.buttonScissors)
        scissorsButton.text = "✌️"
        scissorsButton.setOnClickListener{
            playGame("Scissors")
        }

    }
    private fun playGame(player: String) {
        /*
        Game logic - it selects a random choice for the AI and then calls getWinner function.
         */
        val aiChoice = listOf("Rock", "Paper", "Scissors").random()
        val result = getWinner(player, aiChoice)
        val playerchoice = findViewById<TextView>(R.id.playerchoiceTV)
        playerchoice.text = "Player: ${emoji(player)}"
        val aiChoiceView = findViewById<TextView>(R.id.aichoiceTV)
        aiChoiceView.text = "AI: ${emoji(aiChoice)}"
        val resultView = findViewById<TextView>(R.id.resultTV)
        resultView.text = "Result: $result"
    }
    private fun getWinner(player: String, ai: String): String {
        /*
        This function determines the winner of the game.
         */
        return when {
            player == ai -> "It's a tie!"
            (player == "Rock" && ai == "Scissors") ||
                    (player == "Paper" && ai == "Rock") ||
                    (player == "Scissors" && ai == "Paper") -> "You win!"
            else -> "AI wins!"
        }
    }
    private fun emoji(choice: String): String {
        /*
        This function returns the emoji for the choice.
         */
        return when (choice) {
            "Rock" -> "✊"
            "Paper" -> "✋"
            "Scissors" -> "✌️"
            else -> ""
        }
    }
}