//
//  LearnViewController.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import UIKit

class LearnViewController: UIViewController {
    
    var choosenCategory = ""
    let keywordBrain = KeywordBrain()
    var selectedCategoryKeywords : Array<Keyword> = []
    var keywordNumber = 0

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var turkishLabel: UILabel!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Learn Keywords"
        categoryNameLabel.text = choosenCategory
        
        // 13.08.2022
        for ugur in keywordBrain.allKeywordsArray {
            if ugur.category == choosenCategory {
                selectedCategoryKeywords.append(ugur)
            }
        }
        
        updateUI()
        
        }
    
    func updateUI () {
        englishLabel.text = selectedCategoryKeywords[keywordNumber].englishKeyword
        turkishLabel.text = selectedCategoryKeywords[keywordNumber].turkishKeyword
        
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if keywordNumber + 1 < selectedCategoryKeywords.count {
            keywordNumber += 1
            englishLabel.text = selectedCategoryKeywords[keywordNumber].englishKeyword
            turkishLabel.text = selectedCategoryKeywords[keywordNumber].turkishKeyword
            let barLoading = selectedCategoryKeywords.count - 1
            progressBar.progress = Float(keywordNumber) / Float(barLoading)
        } else {
            nextButtonLabel.isEnabled = false
        }
        
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        if keywordNumber == 0 {
            performSegue(withIdentifier: "goToChoice", sender: nil)
        } else {
            keywordNumber -= 1
            englishLabel.text = selectedCategoryKeywords[keywordNumber].englishKeyword
            turkishLabel.text = selectedCategoryKeywords[keywordNumber].turkishKeyword
            let barLoading = selectedCategoryKeywords.count - 1
            progressBar.progress = Float(keywordNumber) / Float(barLoading)

        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToChoice" {
            let destinationVC = segue.destination as! CoiceViewController
            destinationVC.choosenCategory = choosenCategory
        }
    
    }
}
