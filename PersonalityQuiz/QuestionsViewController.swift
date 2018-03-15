//
//  QuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by Shin Miyanaga on 3/6/18.
//  Copyright © 2018 JohnHerseyHighschool. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    var answerChosen:  [Answer] = []
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
  
    var questionIndex = 0
    var questions : [Question] = [
        Question(text: "Which food do you like the most?" ,
        type: .single,
        answers: [
        Answer(text: "Steak", type: .dog),
        Answer(text: "Fish", type: .cat),
        Answer(text: "Carrots", type: .rabbit),
        Answer(text: "Corn", type: .turtle)
        ]),
        Question(text: "Which activities do you enjoy?" ,
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
            ]),
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get alittle nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog)
                    ])
        ]
    //Single Choice Buttons
   
    @IBOutlet weak var singleButton1: UIButton!
   
    @IBOutlet weak var singleButton2: UIButton!
   
    @IBOutlet weak var singleButton3: UIButton!
    
    @IBOutlet weak var singleButton4: UIButton!
    
    
    //Multiple Choice 1
    @IBOutlet weak var multipleChoiceLabel1: UILabel!
    @IBOutlet weak var multipleChoiceSwitch1: UISwitch!
    
    
    //Multiple Choice 2
    @IBOutlet weak var multipleChoiceLabel2: UILabel!
    @IBOutlet weak var multipleChoiceSwitch2: UISwitch!
    
  
    //Multiple Choice 3
    @IBOutlet weak var multipleChoiceLabel3: UILabel!
    @IBOutlet weak var multipleChoiceSwitch3: UISwitch!
    
    //Multiple Choice 4
    @IBOutlet weak var multipleChoiceLabel4: UILabel!
    @IBOutlet weak var multipleChoiceSwitch4: UISwitch!
    
    //Range
  
    @IBOutlet weak var horizontalSlider: UISlider!
    @IBOutlet weak var rangeLabelLeft: UILabel!
    @IBOutlet weak var rangeLabelRight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
        func updateUI() {
            singleStackView.isHidden = true
            multipleStackView.isHidden = true
            rangeStackView.isHidden = true
            
            let currentQuestion = questions[questionIndex]
            let currentAnswers = currentQuestion.answers
            
            let totalProgress = Float(questionIndex)/Float(questions.count)
            
            navigationItem.title = "Question #\(questionIndex + 1)"
            questionLabel.text = currentQuestion.text
            progressView.setProgress(totalProgress, animated: true)
            switch currentQuestion.type {
            case .single:
                updateSingleStack(using: currentAnswers)
            case .multiple:
                updateMultipleStack(using: currentAnswers)
            case .ranged:
                updateRangedStack(using: currentAnswers)
            }
        }
    
        func nextQuestion() {
            questionIndex += 1
            if questionIndex < questions.count {
                updateUI()
            }else{
                performSegue(withIdentifier: "resultSegue", sender:nil)
            }
      }
    
        func updateSingleStack(using answers: [Answer]) {
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
        func updateMultipleStack(using answers: [Answer]) {
            multipleStackView.isHidden = false
            multipleChoiceLabel1.text = answers[0].text
            multipleChoiceLabel2.text = answers[1].text
            multipleChoiceLabel3.text = answers[2].text
            multipleChoiceLabel4.text = answers[3].text
        
        }
        
        
        func updateRangedStack(using answers: [Answer]) {
            rangeStackView.isHidden = false
            rangeLabelLeft.text = answers.first?.text
            rangeLabelRight.text = answers.last?.text
        }
        
        
    
    
    

    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
    
    let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1: answerChosen.append(currentAnswers[0])
        case singleButton2: answerChosen.append(currentAnswers[1])
        case singleButton3: answerChosen.append(currentAnswers[2])
        case singleButton4: answerChosen.append(currentAnswers[3])
        default: break
        }
        nextQuestion()
    }
}



    
    

  


