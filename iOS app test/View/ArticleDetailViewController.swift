



import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var article: ArticleModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load data into UI
        titleLabel.text = article?.title
        authorLabel.text = article?.author ?? "Unknown Author"
        descriptionLabel.text = article?.description ?? "No description available"

        if let urlString = article?.urlToImage, let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.articleImageView.image = image
                    }
                }
            }
        } else {
            articleImageView.image = UIImage(systemName: "photo")
        }
    }
}
