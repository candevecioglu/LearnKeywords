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
            return idArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteCell
            cell.englishKeywordLabel.text = categoryArray[indexPath.row] // Core Data
            cell.turkishKeywordLabel.text = idArray[indexPath.row] // Core Data
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func getKeyword () {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey: "category") as? String {
                    self.categoryArray.append(name)
                }
                
                if let id = result.value(forKey: "id") as? String {
                    self.idArray.append(id)
                    
                }
                
                if let date = result.value(forKey: "date") as? Date {
                    self.dateArray.append(date)
                    
                }
            }
            
            print(dateArray)
            
        } catch {
            
        }
        
        favoritesTableView.reloadData()
        
    }
    
}
