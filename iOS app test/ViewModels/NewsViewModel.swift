//
//  NewsViewModel.swift
//  native iOS Application - Waed
//


import Foundation

class NewsViewModel {
    
    static let viewModel = NewsViewModel()
    private init() {}
    var articles: [ArticleModel] = []
    
    func getNews(completion: @escaping () -> Void) {
           NetworkManager.shared.fetchArticles { result in
               switch result {
               case .success(let fetchedArticles):
                   self.articles = fetchedArticles
                   DispatchQueue.main.async {
                       completion()
                   }
               case .failure(let error):
                   print("Failed to fetch articles: \(error)")
               }
            
        }
    }
}
