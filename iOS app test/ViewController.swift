//
//  ViewController.swift
//  native iOS Application - Waed
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ArticleTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "articleSB")
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 800
        
        NewsViewModel.viewModel.getNews {
               self.tableView.reloadData()
           }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsViewModel.viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleSB", for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        let article = NewsViewModel.viewModel.articles[indexPath.row]
        cell.configure(with: article) 
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let article = NewsViewModel.viewModel.articles[indexPath.row]
        
        let storyboard = UIStoryboard(name: "ArticleDetailView", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
        detailVC.article = article
        navigationController?.pushViewController(detailVC, animated: true)
    }

}


