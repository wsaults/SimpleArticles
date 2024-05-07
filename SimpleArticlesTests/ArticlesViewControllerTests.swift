//
//  ArticlesTableViewControllerTests.swift
//  SimpleArticlesTests
//
//  Created by Will Saults on 5/6/24.
//

@testable import SimpleArticles
import XCTest

final class ArticlesTableViewControllerTests: XCTestCase {
    
    func test_hasRowsAfterSuccessfulLoad() {
        let (sut, client) = makeSUT(result: .success([Article(title: "Test article")]))
        XCTAssertEqual(sut.tableView.rowCount(), 1)
        XCTAssertEqual(client.fetchArticlesCallCount, 1)
    }
    
    func test_hasNoRowsAfterUnsuccessfulLoad() {
        let (sut, client) = makeSUT(result: .failure(anyNSError()))
        XCTAssertEqual(sut.tableView.rowCount(), 0)
        XCTAssertEqual(client.fetchArticlesCallCount, 1)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(
        result: Result<[Article], any Error>,
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> (ArticlesTableViewController, ArticlesFetchingSpy) {
        let sut = ArticlesTableViewController()
        let client = ArticlesFetchingSpy(result: result)
        sut.articlesClient = client
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, client)
    }
}

class ArticlesFetchingSpy: ArticlesFetching {
    private(set) var fetchArticlesCallCount = 0
    private let result: (ArticlesResult)
    
    init(result: Result<[Article], any Error>) {
        self.result = result
    }
    
    func fetchArticles(completion: @escaping (ArticlesResult) -> Void) {
        fetchArticlesCallCount += 1
        completion(result)
    }
}
