//
//  NewsViewModel.swift
//  native iOS Application - Waed
//


import Foundation

final class NewsViewModel {
    private(set) var articles: [ArticleModel] = []
    var onUpdate: (() -> Void)?
    var onError: ((String) -> Void)?

    func getNews() {
        NetworkManager.shared.fetchArticles { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let fetched):
                self.articles = fetched
                DispatchQueue.main.async { self.onUpdate?() }
            case .failure(let error):
                DispatchQueue.main.async { self.onError?(error.localizedDescription) }
            }
        }
    }
}

