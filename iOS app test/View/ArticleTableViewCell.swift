//
//  ArticleTableViewCell.swift
//  native iOS Application - Waed


import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with article: ArticleModel) {
        titleLbl.text = article.title
        sourceLbl.text = article.source.name
        if let s = article.urlToImage, let url = URL(string: s) {
            ImageLoader.shared.load(url) { [weak self] image in
                self?.img.image = image ?? UIImage(systemName: "photo")
            }
            
        }
    }
    
}
