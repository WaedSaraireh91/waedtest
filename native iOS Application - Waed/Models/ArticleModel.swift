//
//  ArticleModel.swift
//  native iOS Application - Waed
//
//  Created by Majd Attely on 26/07/2025.
//

import Foundation


struct ArticleModel: Decodable {
    let title: String
    let author : String?
    let urlImage: String?
    let soruce: Sorurce
    let description: String?
}

struct Sorurce: Decodable {
    let name: String
   
}
