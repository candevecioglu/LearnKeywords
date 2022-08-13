//
//  Keyword.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import Foundation

struct Keyword {
    
    let category       : String
    let englishKeyword : String
    let wrongAnswers   : [String]
    let turkishKeyword : String
    
    //The initialiser needs to be updated to match the new multiple choice quiz data.
    init(ct: String, en: String, wa: [String], tr: String) {
        category        = ct
        englishKeyword  = en
        wrongAnswers    = wa
        turkishKeyword  = tr
    }
}
