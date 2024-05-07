//
//  APIClient.swift
//  SimpleArticles
//
//  Created by Will Saults on 5/6/24.
//

import Foundation

typealias ArticlesResult = Result<[Article], any Error>

protocol ArticlesFetching {
    func fetchArticles(completion: @escaping (ArticlesResult) -> Void)
}

final class APIClient: ArticlesFetching {
    func fetchArticles(completion: @escaping (ArticlesResult) -> Void) {
        let sampleArticles = [Article(title: "iOS Development"), Article(title: "SwiftUI Essentials")]
        completion(.success(sampleArticles))
    }
}
