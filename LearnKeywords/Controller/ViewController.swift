//
//  ViewController.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var keywordBrain = KeywordBrain()
    @IBOutlet weak var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        self.title = "All Categories"
        
        
        
    }

}

//MARK: - UITableView methods

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if keywordBrain.categoryArray[indexPath.row] == "❤️ Favori Kelimelerin" {
            performSegue(withIdentifier: "goToFavorites", sender: nil)
        } else {
            keywordBrain.selectedCategory = keywordBrain.categoryArray[indexPath.row]
            performSegue(withIdentifier: "goToChoice", sender: nil)
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keywordBrain.categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = keywordBrain.categoryArray[indexPath.row]
        return cell
    }
    
}

//MARK: - Navigation

extension ViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToChoice" {
           let destinationVC = segue.destination as! CoiceViewController
            destinationVC.choosenCategory = keywordBrain.selectedCategory
        }
    }
    
}

