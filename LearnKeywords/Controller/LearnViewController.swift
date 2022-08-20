//
//  LearnViewController.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import UIKit

class LearnViewController: UIViewController {
    
    var choosenCategory = String()
    var keywordBrain = KeywordBrain()
    var keywordNumber = 0

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var turkishLabel: UILabel!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var goToMainPage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        goToMainPage.isHidden = true
        self.title = "Learn Keywords"
        categoryNameLabel.text = choosenCategory
        
        
        updateUI()
        
        }
    
    func updateUI () {
        englishLabel.text = keywordBrain.selectedCategoryKeywords[keywordNumber].englishKeyword
        turkishLabel.text = keywordBrain.selectedCategoryKeywords[keywordNumber].turkishKeyword
        
    }
    
    //MARK: - Next and Back buttons
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if keywordNumber + 1 < keywordBrain.selectedCategoryKeywords.count {
            keywordNumber += 1
            englishLabel.text = keywordBrain.selectedCategoryKeywords[keywordNumber].englishKeyword
            turkishLabel.text = keywordBrain.selectedCategoryKeywords[keywordNumber].turkishKeyword
            let barLoading = keywordBrain.selectedCategoryKeywords.count - 1
            progressBar.progress = Float(keywordNumber) / Float(barLoading)
        } else {
            englishLabel.isHidden = true
            turkishLabel.isHidden = true
            progressBar.isHidden = true
            nextButtonLabel.isHidden = true
            backButtonLabel.isHidden = true
            goToMainPage.isHidden = false
        }
        
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        if keywordNumber == 0 {
            performSegue(withIdentifier: "goToChoice", sender: nil)
        } else {
            keywordNumber -= 1
            englishLabel.text = keywordBrain.selectedCategoryKeywords[keywordNumber].englishKeyword
            turkishLabel.text = keywordBrain.selectedCategoryKeywords[keywordNumber].turkishKeyword
            let barLoading = keywordBrain.selectedCategoryKeywords.count - 1
            progressBar.progress = Float(keywordNumber) / Float(barLoading)

        }
        
        
    }
    

}

//MARK: - Navigation

extension LearnViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToChoice" {
            let destinationVC = segue.destination as! CoiceViewController
            destinationVC.choosenCategory = choosenCategory
        }
    
    }
}
