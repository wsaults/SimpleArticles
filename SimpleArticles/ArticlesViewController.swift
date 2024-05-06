//
//  ArticlesViewController.swift
//  SimpleArticles
//
//  Created by Will Saults on 5/6/24.
//

// Assume this is running in the context of an actual user facing production application.

import UIKit
// nit: empty space?

class ArticlesViewController: UIViewController, UITableViewDataSource { // extension UITableViewDataSource
    var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    // nit: empty space?
    
    
    func fetchData() {
        APIClient.fetchArticles { [self] result in // protocol for APIClient and define above / for testability / make sure we're using weak self
            switch result {
            case .success(let articles):
                self?.articles = articles
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error) // can we log this instead?
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count // nit: optional return
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) // dequeueReusableCell cell extension & nameof(ArticleCell.self)
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
}

struct Article { // codable?
    let title: String
}

class APIClient {
    static func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        let sampleArticles = [Article(title: "iOS Development"), Article(title: "SwiftUI Essentials")]
        completion(.success(sampleArticles))
    }
}
