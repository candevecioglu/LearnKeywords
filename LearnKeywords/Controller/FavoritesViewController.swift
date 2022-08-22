//
//  FavoritesViewController.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        
        #warning("I will show here favorite keywords with Core Data in UITableView")

    }
    



}
