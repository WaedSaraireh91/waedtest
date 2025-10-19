



import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var article: ArticleModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = article?.title
        authorLabel.text = article?.author ?? "Unknown Author"
        descriptionLabel.text = article?.description ?? "No description available"

        if let s = article?.urlToImage, let url = URL(string: s) {
            ImageLoader.shared.load(url) { [weak self] image in
                self?.articleImageView.image = image ?? UIImage(systemName: "photo")
            }
        } else {
            articleImageView.image = UIImage(systemName: "photo")
        }

    }
}
