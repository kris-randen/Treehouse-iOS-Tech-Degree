//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

let QUESTIONS_PER_ROUND: Int = 7

class ViewController: UIViewController
{
    // MARK: - Properties
    
    let questionsPerRound = QUESTIONS_PER_ROUND
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion = 0
    var question = Question()
    var answers = [String]()
    var correctAnswer: String = ""
    
    var gameSound: SystemSoundID = 0
    
    let questions = Trivia.sharedInstance.questions
    
    var questionsAlreadyAsked: Set = [-1]
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var feedbackField: UILabel!
    
    @IBOutlet weak var trueButton: button!
    @IBOutlet weak var falseButton: button!
    @IBOutlet weak var thirdOption: button!
    @IBOutlet weak var fourthOption: button!
    
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loadGameStartSound()
        playGameStartSound()
        displayQuestion()
    }
    
    // MARK: - Helpers
    
    func loadGameStartSound()
    {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound()
    {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func initializeQuestionsAsked()
    {
        questionsAlreadyAsked.removeAll()
    }
    
    func displayQuestion()
    {
        feedbackField.text = ""
        while questionsAlreadyAsked.contains(indexOfSelectedQuestion)
        {
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        }
        print("indexOfSelectedQuestion is \(indexOfSelectedQuestion)")
        questionsAlreadyAsked.insert(indexOfSelectedQuestion)
        question = questions[indexOfSelectedQuestion]
        questionField.text = question.question
        
        answers = question.answers
        
        print("answers.count is \(answers.count)")
        
        switch answers.count
        {
        case 2:
            print("inside case 2")
            trueButton.isHidden = false
            falseButton.isHidden = false
            thirdOption.isHidden = true
            fourthOption.isHidden = true
            trueButton.setTitle(TRUE, for: UIControlState.normal)
            falseButton.setTitle(FALSE, for: UIControlState.normal)
        case 3:
            print("inside case 3")
            trueButton.isHidden = false
            falseButton.isHidden = false
            thirdOption.isHidden = false
            fourthOption.isHidden = true
            trueButton.setTitle(answers[0], for: UIControlState.normal)
            falseButton.setTitle(answers[1], for: UIControlState.normal)
            thirdOption.setTitle(answers[2], for: UIControlState.normal)
        case 4:
            print("inside case 4")
            trueButton.isHidden = false
            falseButton.isHidden = false
            thirdOption.isHidden = false
            fourthOption.isHidden = false
            trueButton.setTitle(answers[0], for: UIControlState.normal)
            falseButton.setTitle(answers[1], for: UIControlState.normal)
            thirdOption.setTitle(answers[2], for: UIControlState.normal)
            fourthOption.setTitle(answers[3], for: UIControlState.normal)
        default:
            print("inside default case")
            break
        }
        
        playAgainButton.isHidden = true
    }
    
    func displayScore()
    {
        // Hide the answer uttons
        trueButton.isHidden = true
        falseButton.isHidden = true
        thirdOption.isHidden = true
        fourthOption.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
    }
    
    func nextRound()
    {
        if questionsAlreadyAsked.count == QUESTIONS_PER_ROUND
        {
            // Game is over
            displayScore()
        } else
        {
            // Continue game
            displayQuestion()
        }
    }
    
    func loadNextRound(delay seconds: Int)
    {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime)
        {
            self.nextRound()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func checkAnswer(_ sender: UIButton)
    {
        // Increment the questions asked counter
        questionsAsked += 1
        
        print("indexOfSelectedQuestion is \(indexOfSelectedQuestion)")
        correctAnswer = question.answers[question.rightAnswer - 1]
        
        if let title = sender.title(for: UIControlState.normal)
        {
            if title == correctAnswer
            {
                correctQuestions += 1
                feedbackField.text = "Correct!"
            }
            else
            {
                feedbackField.text = "Sorry, wrong answer!"
            }
        }
        else
        {
            print("ERROR")
        }
        
        loadNextRound(delay: 2)
    }
    
    
    @IBAction func playAgain(_ sender: UIButton)
    {
        // Show the answer buttons
        trueButton.isHidden = false
        falseButton.isHidden = false
        thirdOption.isHidden = false
        fourthOption.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
}

