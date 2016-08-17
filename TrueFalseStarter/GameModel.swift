//
//  GameModel.swift
//  TrueFalseStarter
//
//  Created by Jonathan Compton on 8/13/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import GameKit

struct GameModel {
    let questionArray:[Question]
    let numberOfQuestions:Int
    var questionsLeft:Int
    let questions = QuestionModel()
    var usedNumber:[Int] = []
    var correctQuestions:Int
    init(){
        questionArray = questions.getQuestionArray()
        numberOfQuestions = questionArray.count
        questionsLeft = numberOfQuestions
        correctQuestions = 0
    }
    mutating func getQuestion()->Question{
        let randomNumber = getRandomNumber()
        return questionArray[randomNumber]
        
        
    }
    
    mutating func getRandomNumber()->Int{
        var randomNumber = 0
        var needNumber = true
        while needNumber{
            randomNumber = GKRandomSource.sharedRandom().nextIntWithUpperBound(questionArray.count)
            if !usedNumber.contains(randomNumber){
                usedNumber.append(randomNumber)
                questionsLeft -= 1
                needNumber = false
            }
        }
        
        
        print(randomNumber)
        return randomNumber
    }
    
    mutating func pointScored(){
        correctQuestions += 1
    }
    
    mutating func reset(){
        questionsLeft = questionArray.count
        usedNumber = []
        correctQuestions = 0
    }
    
    func getScore()->Int{
        return correctQuestions
    }
}