//
//  FavoriteCell.swift
//  LearnKeywords
//
//  Created by M. Can Devecioğlu on 24.08.2022.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    @IBOutlet weak var englishKeywordLabel: UILabel!
    @IBOutlet weak var turkishKeywordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
