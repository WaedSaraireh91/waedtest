//
//  ModelDecodingTests.swift
//  iOS app test
//
//


import XCTest
@testable import iOS_app_test   

final class ModelDecodingTests: XCTestCase {

    func testArticlesResponseDecoding() throws {
        let json = """
        {
          "articles": [
            {
              "title": "Hello",
              "author": "Alice",
              "urlToImage": "https://example.com/img.jpg",
              "source": { "name": "Demo Source" },
              "description": "Sample description"
            },
            {
              "title": "World",
              "author": null,
              "urlToImage": null,
              "source": { "name": "Another Source" },
              "description": null
            }
          ]
        }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(ArticlesResponse.self, from: json)
        XCTAssertEqual(decoded.articles.count, 2)

        let first = decoded.articles[0]
        XCTAssertEqual(first.title, "Hello")
        XCTAssertEqual(first.author, "Alice")
        XCTAssertEqual(first.source.name, "Demo Source")
        XCTAssertEqual(first.description, "Sample description")

        let second = decoded.articles[1]
        XCTAssertEqual(second.title, "World")
        XCTAssertNil(second.author)
        XCTAssertNil(second.urlToImage)
        XCTAssertEqual(second.source.name, "Another Source")
        XCTAssertNil(second.description)
    }
}
