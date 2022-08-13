//
//  QuizViewController.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import UIKit

class QuizViewController: UIViewController {

    var choosenCategory = ""
    let keywordBrain = KeywordBrain()
    @IBOutlet weak var selectedCategoryKeywordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quiz Keywords"

        selectedCategoryKeywordLabel.text = choosenCategory
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
