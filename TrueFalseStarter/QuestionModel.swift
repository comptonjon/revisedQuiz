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
        questions.append(Question(question: "What was Ken Griffey Jr's uniform number?", answers: ["24", "22", "23", "12"], answerIndex: 0))
        questions.append(Question(question: "Who killed Laura Palmer?", answers: ["Dale Cooper", "Leland Palmer", "Harry Truman", "Jerry Horne"], answerIndex: 1))
        questions.append(Question(question: "The Sahara Desert is located in which continent?", answers: ["South America", "Antarctica", "Asia", "Africa"], answerIndex: 3))
        questions.append(Question(question: "Who wrote 'Waiting for Godot'?", answers: ["Arthur Miller", "David Mamet", "Samuel Beckett", "William Shakespeare"], answerIndex: 2))
        questions.append(Question(question: "'Tomorrow Never Knows' is the final song on which Beatles album?", answers: ["Sgt. Pepper's Lonely Hearts Club Band", "Revolver", "Rubber Soul", "Abbey Road"], answerIndex: 1))
        questions.append(Question(question: "Who is the CEO of Apple?", answers: ["Bill Gates", "Steve Jobs", "Tim Cook", "Mark Cuban"], answerIndex: 2))
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

