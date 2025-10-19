//
//  ViewController.swift
//  native iOS Application - Waed
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    private let vm = NewsViewModel()
    private let refreshControl = UIRefreshControl()
    @objc private func refreshNews() { vm.getNews() }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ArticleTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "articleSB")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension

        refreshControl.addTarget(self, action: #selector(refreshNews), for: .valueChanged)
               tableView.refreshControl = refreshControl
        
        vm.onUpdate = { [weak self] in
                    self?.tableView.reloadData()
                    self?.refreshControl.endRefreshing()
                }
                vm.onError = { [weak self] message in
                    self?.refreshControl.endRefreshing()
                    self?.showError(message)
                }
                vm.getNews()
    }
    
    private func showError(_ message: String) {
          let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
          ac.addAction(UIAlertAction(title: "OK", style: .default))
          present(ac, animated: true)
      }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleSB", for: indexPath) as! ArticleTableViewCell
         cell.configure(with: vm.articles[indexPath.row])
         return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
          let article = vm.articles[indexPath.row]
          let sb = UIStoryboard(name: "ArticleDetailView", bundle: nil)
          let vc = sb.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
          vc.article = article
          navigationController?.pushViewController(vc, animated: true)
    }

}


