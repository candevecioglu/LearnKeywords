//
//  Favorite.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 26.08.2022.
//

import Foundation

struct Favorite: Codable {
    
    let favoriteEnglishKeyword : String
    let favoriteTurkishKeyword : String
    let favoriteID             : String
    
    init(favEN: String, favTR: String, favID: String) {
        favoriteEnglishKeyword = favEN
        favoriteTurkishKeyword = favTR
        favoriteID             = favID

    }
    
}
