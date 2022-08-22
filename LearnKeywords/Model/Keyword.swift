//
//  Keyword.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import Foundation

struct Keyword: Codable {
    
    let category       : String
    let englishKeyword : String
    let wrongAnswers   : [String]
    let turkishKeyword : String
    let identifier     : String
    

    init(ct: String, en: String, wa: [String], tr: String, id: String) {
        category        = ct
        englishKeyword  = en
        wrongAnswers    = wa
        turkishKeyword  = tr
        identifier      = id
    }
}
