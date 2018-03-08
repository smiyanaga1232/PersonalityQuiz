//
//  QuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by Shin Miyanaga on 3/6/18.
//  Copyright © 2018 JohnHerseyHighschool. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

  

}
