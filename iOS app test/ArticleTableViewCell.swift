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
        sourceLbl.text = article.source.name
        if let urlString = article.urlToImage, let url = URL(string: urlString) {
                // Download image async
                DispatchQueue.global().async { [weak self] in
                    if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.img.image = image
                        }
                    } else {
                        // failed to get data or create image
                        DispatchQueue.main.async {
                            self?.img.image = UIImage(systemName: "photo") // placeholder image
                        }
                    }
                }
            } else {
            }
    }

    
}
