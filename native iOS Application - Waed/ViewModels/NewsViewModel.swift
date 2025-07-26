//
//  NewsViewModel.swift
//  native iOS Application - Waed
//
//  Created by Majd Attely on 26/07/2025.
//

import Foundation

class NewsViewModel {
    
    
    var articles: [ArticleModel] = []
    
    func getNews(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchArticles { result in
            switch result {
            case .success(let fetchecArticles):
                self.articles = fetchecArticles
                DispatchQueue.main.async {
                    completion()
                }
                
            case .failure(let error):
                print("Failed to fetch articles: \(error)")
                
            }
            
        }
    }
}
