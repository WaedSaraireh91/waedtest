//
//  NetworkManager.swift
//  native iOS Application - Waed
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let baseUrl = "https://raw.githubusercontent.com/majdattely/test-json-api/main/articles.json"
    private let apiKey = "YOUR_API_KEY"
    
    func fetchArticles(completion: @escaping (Result<[ArticleModel], Error>) -> Void) {
        AF.request(baseUrl).responseDecodable(of: [ArticleModel].self) { response in
            switch response.result {
            case .success(let articles):
                completion(.success(articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

