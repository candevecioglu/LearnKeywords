//
//  CoiceViewController.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import UIKit

class CoiceViewController: UIViewController {
    
    var choosenCategory = ""
    let keywordBrain = KeywordBrain()
    
    @IBOutlet weak var chosenCategoryChoiseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Learn or Quiz"
        chosenCategoryChoiseLabel.text = choosenCategory
    }
    
 
    @IBAction func learnButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToLearn", sender: nil)
        
    }
    
    
    @IBAction func quizButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToQuiz", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLearn" {
            let destinationVC = segue.destination as! LearnViewController
            destinationVC.choosenCategory = choosenCategory
        }
        
        if segue.identifier == "goToQuiz" {
            let destinationVC = segue.destination as! QuizViewController
            destinationVC.choosenCategory = choosenCategory
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
