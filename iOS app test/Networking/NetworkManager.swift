import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
  
    
    func fetchArticles(completion: @escaping (Result<[ArticleModel], Error>) -> Void) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=af585c9c22664d819bb341c2a2bec4c8"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -2)))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(ArticlesResponse.self, from: data)
                completion(.success(decoded.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

}
