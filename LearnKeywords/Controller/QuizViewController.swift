//
//  QuizViewController.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import UIKit

class QuizViewController: UIViewController {
    
    var choosenCategory = ""
    var keywordBrain = KeywordBrain()
    var selectedCategoryKeywords : Array<Keyword> = []
    var keywordNumber = 0
    var answerArray : Array<String> = []
    var score = 0

    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var selectedCategoryKeywordLabel: UILabel!
    
    @IBOutlet weak var answer1Label: UIButton!
    @IBOutlet weak var answer2Label: UIButton!
    @IBOutlet weak var answer3Label: UIButton!
    @IBOutlet weak var answer4Label: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quiz Keywords"
        selectedCategoryKeywordLabel.text = choosenCategory
        
        func sendCategory () -> String {
            return choosenCategory
        }
        
        for ugur in keywordBrain.allKeywordsArray {
            if ugur.category == choosenCategory {
                selectedCategoryKeywords.append(ugur)
            }
        }
        
        updateUI()
    }
    
    func updateUI () {
        
        answerArray = [selectedCategoryKeywords[keywordNumber].turkishKeyword,
                           selectedCategoryKeywords[keywordNumber].wrongAnswers[0],
                           selectedCategoryKeywords[keywordNumber].wrongAnswers[1],
                           selectedCategoryKeywords[keywordNumber].wrongAnswers[2]]
         answerArray.shuffle()
        
        
        englishLabel.text = selectedCategoryKeywords[keywordNumber].englishKeyword
        answer1Label.setTitle(answerArray[0], for: .normal)
        answer2Label.setTitle(answerArray[1], for: .normal)
        answer3Label.setTitle(answerArray[2], for: .normal)
        answer4Label.setTitle(answerArray[3], for: .normal)
        
    }
    

    @IBAction func answerClicked(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        if userAnswer == selectedCategoryKeywords[keywordNumber].turkishKeyword {
            keywordNumber += 1
            let barLoading = selectedCategoryKeywords.count - 1

            answerArray.removeAll()
            updateUI()
        }
        
        
    }


}
