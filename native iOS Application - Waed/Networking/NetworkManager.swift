//
//  NetworkManager.swift
//  native iOS Application - Waed
//
//  Created by Majd Attely on 26/07/2025.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let baseUrl = "https://jsonplaceholder.typicode.com/posts"
    private let apiKey = "YOUR_API_KEY"
    
    func fetchArticles(completion: @escaping ([ArticleModel]) -> Void) {
        let parameters: Parameters = [
            "apiKey": apiKey
        ]
        
        AF.request(baseUrl, method: .get, parameters: parameters).responseDecodable(of: newsResponse.self) { response in
            switch response.result {
            case .success(let newsResponse):
                completion(articles)
            case .failure(let error):
                print("Failed to fetch articles: \(error)")
                completion([])
            }
        }
    }
}

