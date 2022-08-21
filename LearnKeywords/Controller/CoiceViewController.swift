//
//  CoiceViewController.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import UIKit

class CoiceViewController: UIViewController {
    var choosenCategory = String()
    var keywordBrain = KeywordBrain()
    
    @IBOutlet weak var chosenCategoryChoiseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Learn or Quiz"
        chosenCategoryChoiseLabel.text = choosenCategory
        
        for selection in keywordBrain.allKeywordsArray {
            if selection.category == choosenCategory {
                keywordBrain.selectedCategoryKeywords.append(selection)
            }
        }
        

    }
    
    // MARK: - Buttons
    
    @IBAction func learnButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLearn", sender: nil)
    }
    
    @IBAction func quizButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToQuiz", sender: nil)
    }
    
}
    
    // MARK: - Navigation
    
    extension CoiceViewController {
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLearn" {
            let destinationVC = segue.destination as! LearnViewController
            destinationVC.choosenCategory = choosenCategory
            destinationVC.selectedCategoryForLearnKeywords = keywordBrain.selectedCategoryKeywords
        }
        
        if segue.identifier == "goToQuiz" {
            let destinationVC = segue.destination as! QuizViewController
            destinationVC.choosenCategory = choosenCategory
            destinationVC.selectedCategoryForQuizKeywords = keywordBrain.selectedCategoryKeywords
        }
        
    }

}
