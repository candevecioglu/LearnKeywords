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
    

    @IBOutlet weak var categoryNameLabel: UILabel!
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
        
        for can in selectedCategoryKeywords {
            print(can.turkishKeyword)
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
