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
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var goToMainPage: UIButton!
    
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
        goToMainPage.isHidden = true
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
            alert(title: "Correct!", message: "Answer is correct!")
            
            if keywordNumber + 1 < selectedCategoryKeywords.count {
                keywordNumber += 1
                let barLoading = selectedCategoryKeywords.count - 1
                progressBar.progress = Float(keywordNumber) / Float(barLoading)
                answerArray.removeAll()
                updateUI()
            } else {
                goToMainPage.isHidden = false
                englishLabel.isHidden = true
                answer1Label.isHidden = true
                answer2Label.isHidden = true
                answer3Label.isHidden = true
                answer4Label.isHidden = true
                progressBar.isHidden = true
            }
        } else {
            alert(title: "Wrong!", message: "Answer is wrong!")
            keywordNumber += 1
            let barLoading = selectedCategoryKeywords.count - 1
            progressBar.progress = Float(keywordNumber) / Float(barLoading)
            answerArray.removeAll()
            updateUI()
        }
        
        
    }
    
    func alert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
         let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in }
             alert.addAction(okButton)
             self.present(alert, animated: true, completion: nil)
    }


}
