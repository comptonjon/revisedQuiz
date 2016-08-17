//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    let lightningTime = 10
    let color = ColorModel()
    var gameModel = GameModel()
    var sounds = Sounds()
    var question:Question? = nil
    var timer = NSTimer()
    var lightningRoundSeconds = 15


    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Start game
        sounds.playIntro()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func displayQuestion() {
        
        playAgainButton.hidden = true
        view.backgroundColor = color.game
        question = gameModel.getQuestion()
        questionField.text = question!.question
        buttonOne.setTitle(question!.answers[0], forState: UIControlState.Normal)
        buttonTwo.setTitle(question!.answers[1], forState: UIControlState.Normal)
        buttonThree.setTitle(question!.answers[2], forState: UIControlState.Normal)
        buttonFour.setTitle(question!.answers[3], forState: UIControlState.Normal)
    }
    
    func displayScore() {
        view.backgroundColor = color.game
        
        // Hide the answer buttons
        buttonOne.hidden = true
        buttonTwo.hidden = true
        buttonThree.hidden = true
        buttonFour.hidden = true
        
        // Display play again button
        playAgainButton.hidden = false
        let score = gameModel.getScore()
        let message:String
        if score > 3 {
            message = "Way to go!"
            
        } else {
            message = "Better luck next time!"
        }
        questionField.text = "\(message)\nYou got \(score) out of \(gameModel.numberOfQuestions) correct!"
    }
    
    @IBAction func buttonOnePress(sender: AnyObject) {
        checkAnswer(0)
    }
    
    @IBAction func buttonTwoPress(sender: AnyObject) {
        checkAnswer(1)
    }
    
    @IBAction func buttonThreePress(sender: AnyObject) {
        checkAnswer(2)
    }
    
    @IBAction func buttonFourPress(sender: AnyObject) {
        checkAnswer(3)
    }
    func checkAnswer(answer: Int) {
       
        let correctAnswer = question!.answerIndex
        
        if (answer == correctAnswer) {
            gameModel.pointScored()
            displayResult(true, correctAnswer: correctAnswer)
        } else {
            displayResult(false, correctAnswer: correctAnswer)
        }
        
        
    }
    
    func displayResult(isCorrect: Bool, correctAnswer: Int){
        let time:Int
        if isCorrect{
            questionField.text = "Correct!"
            view.backgroundColor = color.correct
            sounds.resultSound(true)
            time = 1
            
        } else {
            view.backgroundColor = color.wrong
            sounds.resultSound(false)
            questionField.text = "Sorry, wrong answer!  The correct answer was \(question!.answers[correctAnswer])."
            time = 2
        }
        loadNextRoundWithDelay(seconds: time)
    }
    
    func nextRound() {
        if gameModel.questionsLeft <= 2 && gameModel.questionsLeft > 0{
            lightningMode()
        }
        if gameModel.questionsLeft == 0 {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        
        // Show the answer buttons
        buttonOne.hidden = false
        buttonTwo.hidden = false
        buttonThree.hidden = false
        buttonFour.hidden = false
        let newModel = GameModel()
        gameModel = newModel
        nextRound()
        sounds.playIntro()
    }
    
    func lightningMode(){
        lightningRoundSeconds = 15
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        
    }
    
    func processTimer(){
        
        if lightningRoundSeconds == 1 {
            timer.invalidate()
            displayResult(false, correctAnswer: question!.answerIndex)
        }
        lightningRoundSeconds -= 1
        timeLabel.text = String(lightningRoundSeconds)
        
        
    }
    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
}
    


