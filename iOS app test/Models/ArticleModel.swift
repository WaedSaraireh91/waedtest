
//  ArticleModel.swift
//  native iOS Application - Waed


import Foundation


struct ArticleModel: Decodable {
    let title: String
    let author: String?
    let urlToImage: String?
    let source: Source
    let description: String?
}


struct Source: Decodable {
    let name: String
   
}

struct ArticlesResponse: Decodable {
    let articles: [ArticleModel]
}

