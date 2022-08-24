//
//  LearnViewController.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import UIKit
import CoreData

class LearnViewController: UIViewController {
    
    var choosenCategory                     = String()
    var keywordBrain                        = KeywordBrain()
    var keywordNumber                       = 0
    var selectedCategoryForLearnKeywords    = Array<Keyword>()

    @IBOutlet weak var categoryNameLabel    : UILabel!
    @IBOutlet weak var englishLabel         : UILabel!
    @IBOutlet weak var turkishLabel         : UILabel!
    @IBOutlet weak var backButtonLabel      : UIButton!
    @IBOutlet weak var nextButtonLabel      : UIButton!
    @IBOutlet weak var progressBar          : UIProgressView!
    @IBOutlet weak var goToMainPage         : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goToMainPage.isHidden  = true
        self.title             = "Learn Keywords"
        categoryNameLabel.text = choosenCategory
        
        updateUI()
        
        }
    
    func updateUI () {
        
        englishLabel.text = selectedCategoryForLearnKeywords[keywordNumber].englishKeyword
        turkishLabel.text = selectedCategoryForLearnKeywords[keywordNumber].turkishKeyword
        print(selectedCategoryForLearnKeywords[keywordNumber].identifier)
        
    }
    
    //MARK: - Next and Back buttons
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if keywordNumber + 1 < selectedCategoryForLearnKeywords.count {
            keywordNumber += 1
            englishLabel.text = selectedCategoryForLearnKeywords[keywordNumber].englishKeyword
            turkishLabel.text = selectedCategoryForLearnKeywords[keywordNumber].turkishKeyword
            let barLoading = selectedCategoryForLearnKeywords.count - 1
            progressBar.progress = Float(keywordNumber) / Float(barLoading)
        } else {
            englishLabel.isHidden       = true
            turkishLabel.isHidden       = true
            progressBar.isHidden        = true
            nextButtonLabel.isHidden    = true
            backButtonLabel.isHidden    = true
            goToMainPage.isHidden       = false
        }
        
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        if keywordNumber == 0 {
            performSegue(withIdentifier: "goToChoice", sender: nil)
        } else {
            keywordNumber -= 1
            englishLabel.text = selectedCategoryForLearnKeywords[keywordNumber].englishKeyword
            turkishLabel.text = selectedCategoryForLearnKeywords[keywordNumber].turkishKeyword
            let barLoading = selectedCategoryForLearnKeywords.count - 1
            progressBar.progress = Float(keywordNumber) / Float(barLoading)

        }
        
        
    }
    
    //MARK: - Add to favorites with CoreData and UUID
    
    @IBAction func addToFavorites(_ sender: UIButton) {
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Favorites", into: context)
        
        #warning("It should be an array for decent data type")
        
        saveData.setValue(selectedCategoryForLearnKeywords[keywordNumber].identifier, forKey: "id")
        saveData.setValue(selectedCategoryForLearnKeywords[keywordNumber].category, forKey: "category")
        saveData.setValue(selectedCategoryForLearnKeywords[keywordNumber].englishKeyword, forKey: "englishKeyword")
        saveData.setValue(selectedCategoryForLearnKeywords[keywordNumber].turkishKeyword, forKey: "turkishKeyword")
        saveData.setValue(UUID(), forKey: "uuid")
        
        do {
            try context.save()
            print("Bu güzellik değil facia!")

            
            
        } catch {
            print("Context Error")
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
