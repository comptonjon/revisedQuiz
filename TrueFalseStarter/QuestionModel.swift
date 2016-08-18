//
//  QuestionModel.swift
//  TrueFalseStarter
//
//  Created by Jonathan Compton on 8/13/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import GameKit

struct QuestionModel {
    var questions:[Question] = []
    
    init (){
        loadArray()
    }
    
    /*internal struct Question {
     let question:String
     let answers:[String]
     let answerIndex:Int
     }
     */
    mutating func loadArray(){
        
        questions.append(Question(question: "This was the only US President to serve more than two consecutive terms.", answers: ["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"], answerIndex: 1))
        questions.append(Question(question: "Which of the following countries has the most residents?", answers: ["Nigeria", "Russia", "Iran", "Vietnam"], answerIndex: 0))
        questions.append(Question(question: "In what year was the United Nations founded?", answers: ["1918", "1919", "1945", "1954"], answerIndex: 2))
        questions.append(Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", answers: ["Paris", "Washington D.C.", "New York City", "Boston"], answerIndex: 2))
        questions.append(Question(question: "Which nation produces the most oil?", answers: ["Iran", "Iraq", "Brazil", "Canada"], answerIndex: 3))
        questions.append(Question(question: "Which country has most recently won consecutive World Cups in Soccer?", answers: ["Italy", "Brazil", "Argentina", "Spain"], answerIndex: 1))
        questions.append(Question(question: "Which of the following rivers is longest?", answers: ["Yangtze", "Mississippi", "Congo", "Mekong"], answerIndex: 1))
        questions.append(Question(question: "Which city is oldest?", answers: ["Mexico City", "Cape Town", "San Juan", "Sydney"], answerIndex: 0))
        questions.append(Question(question: "Which country was the first to allow women to vote in national elections?", answers: ["Poland", "United States", "Sweden", "Senegal"], answerIndex: 0))
        questions.append(Question(question: "Which of these countries won the most medals in the 2012 Summer Games?", answers: ["France", "Germany", "Japan", "Great Britain"], answerIndex: 3))
        
    }
    
    mutating func getQuestion()-> Question?{
        if questions.count > 1 {
            let randomNumber = GKRandomSource.sharedRandom().nextIntWithUpperBound(questions.count)
            let question = questions[randomNumber]
            questions.removeAtIndex(randomNumber)
            return question
        } else if questions.count == 1 {
            let question = questions[0]
            questions = []
            return question
        } else {
            return nil
        }
    }
    func getQuestionArray()->[Question]{
        return questions
    }
}

