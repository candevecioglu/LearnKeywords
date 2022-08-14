//
//  KeywordBrain.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 13.08.2022.
//

import Foundation

struct KeywordBrain {
    
    var selectedCategoryKeywords : Array<Keyword> = []
    var keywordNumber = 0
    var score = 0
    let categoryArray = ["✈️ Havacılık", "💸 Bankacılık", "💻 Bilişim"]
    
    let allKeywordsArray = [
        
        Keyword(ct: "✈️ Havacılık", en: "Plane", wa: ["Tren", "Karavan", "Planör"], tr: "Uçak"),
        Keyword(ct: "✈️ Havacılık", en: "Wing", wa: ["Motor", "Sürtünme", "Kuyruk"], tr: "Kanat"),
        Keyword(ct: "✈️ Havacılık", en: "Elevator", wa: ["Asansör", "Kuyruk", "Dikme"], tr: "Kanatçık"),
        Keyword(ct: "✈️ Havacılık", en: "Engine", wa: ["Piston", "Masa", "Kahvaltı"], tr: "Motor"),
        Keyword(ct: "✈️ Havacılık", en: "Aircraft", wa: ["Uzay", "Vagon", "İmalat"], tr: "Uçak"),
        Keyword(ct: "✈️ Havacılık", en: "Space", wa: ["Atmosfer", "Radyatör", "Statosfer"], tr: "Uzay"),
        Keyword(ct: "✈️ Havacılık", en: "Weather", wa: ["Yağmur", "Bulut", "Rüzgar"], tr: "Hava durumu"),
        Keyword(ct: "✈️ Havacılık", en: "Aviation", wa: ["Personeli", "Yakıt", "Askeri"], tr: "Havacılık"),
        Keyword(ct: "✈️ Havacılık", en: "Cockpit", wa: ["Bagaj", "Ücret", "Rötar"], tr: "Kokpit"),
        Keyword(ct: "✈️ Havacılık", en: "Simulator", wa: ["Eğitim", "Antrenman", "Değerlendirme"], tr: "Simülatör"),
        
        Keyword(ct: "💸 Bankacılık", en: "Loan", wa: ["Emanet", "Ekstre", "Kredi"], tr: "Borç"),
        Keyword(ct: "💸 Bankacılık", en: "Invesment", wa: ["Faiz", "Temettü", "Enflasyon"], tr: "Yatırım"),
        Keyword(ct: "💸 Bankacılık", en: "Interest", wa: ["Mal", "Piyasa", "Borsa"], tr: "Faiz"),
        Keyword(ct: "💸 Bankacılık", en: "Branch", wa: ["Paylaşım", "Karavan", "Planör"], tr: "Şube"),
        Keyword(ct: "💸 Bankacılık", en: "Mortgage", wa: ["Kredi", "Faizsiz", "Develüasyon"], tr: "İpotek"),
        Keyword(ct: "💸 Bankacılık", en: "Fund", wa: ["İşsizlik", "Sahipsiz", "Enflasyon"], tr: "Fon"),
        Keyword(ct: "💸 Bankacılık", en: "Stock", wa: ["Borsa", "Bulma", "Yağma"], tr: "Hisse"),
        Keyword(ct: "💸 Bankacılık", en: "Purchase", wa: ["İade", "Geri alım", "Üretim"], tr: "Satın alma"),
        Keyword(ct: "💸 Bankacılık", en: "Share", wa: ["Sosyal medya", "Dağıtma", "Ortak"], tr: "İştirak"),
        Keyword(ct: "💸 Bankacılık", en: "Withdrawal", wa: ["Yatırma", "Borç", "Kredi"], tr: "Para çekme"),
        
        Keyword(ct: "💻 Bilişim", en: "Software", wa: ["Giriş", "Donanım", "Çevre bilimleri"], tr: "Yazılım"),
        Keyword(ct: "💻 Bilişim", en: "Hardware", wa: ["Yazılım", "İndirme", "Yükleme"], tr: "Donanım"),
        Keyword(ct: "💻 Bilişim", en: "Developer", wa: ["Deve", "Yazılım", "Program"], tr: "Geliştirici"),
        Keyword(ct: "💻 Bilişim", en: "User", wa: ["Ekleme", "Çıkarma", "Kaydolma"], tr: "Kullenıcı"),
        Keyword(ct: "💻 Bilişim", en: "Download", wa: ["Yükleme", "Silme", "Sıfırlama"], tr: "İndirme"),
        Keyword(ct: "💻 Bilişim", en: "Upload", wa: ["İndirme", "Yazılımcı", "İnternet"], tr: "Yükleme"),
        Keyword(ct: "💻 Bilişim", en: "Bandwith", wa: ["Uzunluk", "Hız", "Güncelleme"], tr: "Bant genişliği"),
        Keyword(ct: "💻 Bilişim", en: "Source", wa: ["Kopyalama", "Yapıştırma", "Kesme"], tr: "Kaynak"),
        Keyword(ct: "💻 Bilişim", en: "Update", wa: ["İndirme", "Geri", "İleri"], tr: "Güncelleme"),
        Keyword(ct: "💻 Bilişim", en: "Downgrade", wa: ["Güncelleme", "Silme", "Yükleme"], tr: "Düşürme"),

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
        } else {
            keywordNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == selectedCategoryKeywords[keywordNumber].turkishKeyword {
            score += 1
            return true
        } else {
            return false
        }
    }
    
}
