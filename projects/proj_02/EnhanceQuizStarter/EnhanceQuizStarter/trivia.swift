//
//  trivia.swift
//  EnhanceQuizStarter
//
//  Created by Kris Rajendren on Jun/10/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

let TRUE: String = "True"
let FALSE: String = "False"
let NUMBER_OF_ANSWERS_ALLOWED: Int = 4

let QUESTIONS: [String] =
    [
        "This was the only US President to serve more than two consecutive terms.",
        "Which of the following countries has the most residents?",
        "In what year was the United Nations founded?",
        "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
        "Which nation produces the most oil?",
        "Which country has most recently won consecutive World Cups in Soccer?",
        "Which of the following rivers is longest?",
        "Which city is the oldest?",
        "Which country was the first to allow women to vote in national elections?",
        "Which of these countries won the most medals in the 2012 Summer Games?",
        "Only female koalas can whistle",
        "Blue whales are technically whales",
        "Camels are cannibalistic",
        "All ducks are birds"
    ]

let ANSWERS: [[String]] =
    [
        ["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"],
        ["Nigeria", "Russia", "Iran", "Vietnam"],
        ["1918", "1919", "1945", "1954"],
        ["Paris", "Washington D.C.", "New York City", "Boston"],
        ["Iran", "Iraq", "Brazil", "Canada"],
        ["Italy", "Brazil", "Argetina", "Spain"],
        ["Yangtze", "Mississippi", "Congo", "Mekong"],
        ["Mexico City", "Cape Town", "San Juan", "Sydney"],
        ["Poland", "United States", "Sweden", "Senegal"],
        ["France", "Germany", "Japan", "Great Britian"],
        ["True", "False"],
        ["True", "False"],
        ["True", "False"],
        ["True", "False"]
    ]

let RIGHT_ANSWERS: [Int] =
    [
        2,
        1,
        3,
        3,
        4,
        2,
        2,
        1,
        1,
        4,
        2,
        1,
        2,
        1
    ]

struct Question
{
    var question: String
    var answers: [String]
    var rightAnswer: Int
    
    init()
    {
        self.question = ""
        self.answers = []
        self.rightAnswer = -1
    }
    
    init(question: String, answers: [String], rightAnswer: Int)
    {
        self.init()
        
        if answers.count > NUMBER_OF_ANSWERS_ALLOWED || rightAnswer - 1 < 0 || rightAnswer > answers.count
        {
            printOutofBoundsError(numberOfAnswers: answers.count, rightAnswer: rightAnswer)
        }
        else
        {
            self.question = question
            self.answers = answers
            self.rightAnswer = rightAnswer
        }
    }
    
    func printOutofBoundsError(numberOfAnswers: Int, rightAnswer: Int)
    {
        print("This game currently only supports \(NUMBER_OF_ANSWERS_ALLOWED) possible answers to a question. Your question has \(numberOfAnswers) answers and the right answer index is \(rightAnswer). Either you have an input that exceeds the number of answers or the right answer index is out of bounds.")
    }
}

class Trivia
{
    var questions = [Question](repeating: Question(), count: QUESTIONS.count)
    
    init(questions: [String], answers: [[String]], rightAnswers: [Int])
    {
        if (questions.count, answers.count) != (answers.count, rightAnswers.count)
        {
            printUnbalancedInputError(numberOfQuestions: questions.count, numberOfAnswers: answers.count, rightAnswers: rightAnswers.count)
        }
        for i in 0..<questions.count
        {
            self.questions[i] = Question(question: questions[i], answers: answers[i], rightAnswer: rightAnswers[i])
        }
    }
    
    func printUnbalancedInputError(numberOfQuestions: Int, numberOfAnswers: Int, rightAnswers: Int)
    {
        print("There is a mismatch in the size of the input arrays. The number of questions is \(numberOfQuestions) and the number of answers is \(numberOfAnswers) and the number of right answers is \(rightAnswers)")
    }
    
    static let sharedInstance = Trivia(questions: QUESTIONS, answers: ANSWERS, rightAnswers: RIGHT_ANSWERS)
}


