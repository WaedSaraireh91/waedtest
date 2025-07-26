
//  ArticleModel.swift
//  native iOS Application - Waed


import Foundation


struct ArticleModel: Decodable {
    let title: String
    let author : String?
    let urlImage: String?
    let soruce: Source
    let description: String?
}

struct Source: Decodable {
    let name: String
   
}
