//
//  KeywordBrain.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import Foundation

struct KeywordBrain {
    
    var selectedCategoryKeywords = Array<Keyword>()
    var selectedCategory = String()
    var keywordNumber = 0
    var score = 0
    let categoryArray = ["❤️ Favori Kelimelerin",
                         "✈️ Havacılık",
                         "💸 Bankacılık",
                         "💻 Bilişim"
    ]
    
    var allKeywordsArray = [
        
        Keyword(ct: "✈️ Havacılık", en: "Plane", wa: ["Zeplin", "Karavan", "Planör"], tr: "Uçak", id: UUID().uuidString),
        Keyword(ct: "✈️ Havacılık", en: "Wing", wa: ["Motor", "Sürtünme", "Kuyruk"], tr: "Kanat", id: UUID().uuidString),
        Keyword(ct: "✈️ Havacılık", en: "Elevator", wa: ["Asansör", "Kuyruk", "Dikme"], tr: "Kanatçık", id: UUID().uuidString),
        Keyword(ct: "✈️ Havacılık", en: "Engine", wa: ["Piston", "Masa", "Kahvaltı"], tr: "Motor", id: UUID().uuidString),
        Keyword(ct: "✈️ Havacılık", en: "Aircraft", wa: ["Uzay", "Vagon", "İmalat"], tr: "Uçak", id: UUID().uuidString),
        Keyword(ct: "✈️ Havacılık", en: "Space", wa: ["Atmosfer", "Radyatör", "Statosfer"], tr: "Uzay", id: UUID().uuidString),
        Keyword(ct: "✈️ Havacılık", en: "Weather", wa: ["Yağmur", "Bulut", "Rüzgar"], tr: "Hava durumu", id: UUID().uuidString),
        Keyword(ct: "✈️ Havacılık", en: "Aviation", wa: ["Personeli", "Yakıt", "Askeri"], tr: "Havacılık", id: UUID().uuidString),
        Keyword(ct: "✈️ Havacılık", en: "Cockpit", wa: ["Bagaj", "Ücret", "Rötar"], tr: "Kokpit", id: UUID().uuidString),
        Keyword(ct: "✈️ Havacılık", en: "Simulator", wa: ["Eğitim", "Antrenman", "Değerlendirme"], tr: "Simülatör", id: UUID().uuidString),
        
        Keyword(ct: "💸 Bankacılık", en: "Loan", wa: ["Emanet", "Ekstre", "Kredi"], tr: "Borç", id: UUID().uuidString),
        Keyword(ct: "💸 Bankacılık", en: "Invesment", wa: ["Faiz", "Temettü", "Enflasyon"], tr: "Yatırım", id: UUID().uuidString),
        Keyword(ct: "💸 Bankacılık", en: "Interest", wa: ["Mal", "Piyasa", "Borsa"], tr: "Faiz", id: UUID().uuidString),
        Keyword(ct: "💸 Bankacılık", en: "Branch", wa: ["Paylaşım", "Karavan", "Planör"], tr: "Şube", id: UUID().uuidString),
        Keyword(ct: "💸 Bankacılık", en: "Mortgage", wa: ["Kredi", "Faizsiz", "Develüasyon"], tr: "İpotek", id: UUID().uuidString),
        Keyword(ct: "💸 Bankacılık", en: "Fund", wa: ["İşsizlik", "Sahipsiz", "Enflasyon"], tr: "Fon", id: UUID().uuidString),
        Keyword(ct: "💸 Bankacılık", en: "Stock", wa: ["Borsa", "Bulma", "Yağma"], tr: "Hisse", id: UUID().uuidString),
        Keyword(ct: "💸 Bankacılık", en: "Purchase", wa: ["İade", "Geri alım", "Üretim"], tr: "Satın alma", id: UUID().uuidString),
        Keyword(ct: "💸 Bankacılık", en: "Share", wa: ["Sosyal medya", "Dağıtma", "Ortak"], tr: "İştirak", id: UUID().uuidString),
        Keyword(ct: "💸 Bankacılık", en: "Withdrawal", wa: ["Yatırma", "Borç", "Kredi"], tr: "Para çekme", id: UUID().uuidString),
        
        Keyword(ct: "💻 Bilişim", en: "Software", wa: ["Giriş", "Donanım", "Çevre bilimleri"], tr: "Yazılım", id: UUID().uuidString),
        Keyword(ct: "💻 Bilişim", en: "Hardware", wa: ["Yazılım", "İndirme", "Yükleme"], tr: "Donanım", id: UUID().uuidString),
        Keyword(ct: "💻 Bilişim", en: "Developer", wa: ["Deve", "Yazılım", "Program"], tr: "Geliştirici", id: UUID().uuidString),
        Keyword(ct: "💻 Bilişim", en: "User", wa: ["Ekleme", "Çıkarma", "Kaydolma"], tr: "Kullenıcı", id: UUID().uuidString),
        Keyword(ct: "💻 Bilişim", en: "Download", wa: ["Yükleme", "Silme", "Sıfırlama"], tr: "İndirme", id: UUID().uuidString),
        Keyword(ct: "💻 Bilişim", en: "Upload", wa: ["İndirme", "Yazılımcı", "İnternet"], tr: "Yükleme", id: UUID().uuidString),
        Keyword(ct: "💻 Bilişim", en: "Bandwith", wa: ["Uzunluk", "Hız", "Güncelleme"], tr: "Bant genişliği", id: UUID().uuidString),
        Keyword(ct: "💻 Bilişim", en: "Source", wa: ["Kopyalama", "Yapıştırma", "Kesme"], tr: "Kaynak", id: UUID().uuidString),
        Keyword(ct: "💻 Bilişim", en: "Update", wa: ["İndirme", "Geri", "İleri"], tr: "Güncelleme", id: UUID().uuidString),
        Keyword(ct: "💻 Bilişim", en: "Downgrade", wa: ["Güncelleme", "Silme", "Yükleme"], tr: "Düşürme", id: UUID().uuidString)
        
    ]
    
    mutating func checkAnswer (_ userAnswer : String) -> Bool {
        if userAnswer == selectedCategoryKeywords[keywordNumber].turkishKeyword {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return selectedCategoryKeywords[keywordNumber].englishKeyword
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return selectedCategoryKeywords[keywordNumber].wrongAnswers
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if keywordNumber + 1 < selectedCategoryKeywords.count {
            keywordNumber += 1
            print(keywordNumber)
        } else {
            keywordNumber = 0
        }
         
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == selectedCategoryKeywords[keywordNumber].turkishKeyword {
            score += 1
            print(selectedCategoryKeywords.count)
            print(keywordNumber)
            return true
        } else {
            return false
        }
    }
    
}
