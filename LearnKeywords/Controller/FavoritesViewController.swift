//
//  FavoritesViewController.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {
    
    var favoriteArray : Array<Favorite> = []
    
    
    
    var categoryArray = [String()]
    var idArray = [String()]
    var dateArray = [Date()]
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
        self.title = "Favorites"
        
        #warning("I will show here favorite keywords with Core Data in UITableView")
        
        getKeyword()
        

    }
    



}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoriteArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteCell
            cell.englishKeywordLabel.text = favoriteArray[indexPath.row].favoriteEnglishKeyword // Core Data
            cell.turkishKeywordLabel.text = favoriteArray[indexPath.row].favoriteTurkishKeyword // Core Data
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          
          self.favoriteArray.remove(at: indexPath.row) // Delete from static array
          favoritesTableView.reloadData()
      }
        

        
    }
    
    

    
    func getKeyword () {
        
        self.favoriteArray.removeAll(keepingCapacity: true)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                
                if let favEN = result.value(forKey: "englishKeyword") as? String,
                    let favTR = result.value(forKey: "turkishKeyword") as? String,
                    let favID = result.value(forKey: "id") as? String {
                    self.favoriteArray.append(Favorite(favEN: favEN, favTR: favTR, favID: favID))
                }
            
            }
            
            print(favoriteArray)
            
        } catch {
            
        }
        
        favoritesTableView.reloadData()
        
    }
    
}
