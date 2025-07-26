//
//  ArticleTableViewCell.swift
//  native iOS Application - Waed
//
//  Created by Majd Attely on 26/07/2025.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with article: ArticleModel) {
        titleLbl.text = article.title
        sourceLbl.text = article.soruce.name

        if let imageUrl = article.urlImage, let url = URL(string: imageUrl) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.img.image = UIImage(data: data)
                    }
                }
            }
        } else {
            self.img.image = nil
        }
    }

    
}
