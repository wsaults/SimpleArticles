//
//  ArticlesTableViewController.swift
//  SimpleArticles
//
//  Created by Will Saults on 5/6/24.
//

import os
import UIKit

final class ArticlesTableViewController: UITableViewController  {
    private let logger = Logger(subsystem: "com.Saults.SimpleArticles", category: "main")
    private(set) var articles: [Article] = []
    var articlesClient: ArticlesFetching = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ArticleCell.self)
        fetchData()
    }
    
    func fetchData() {
        articlesClient.fetchArticles { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let articles):
                self.articles = articles
                self.reloadData()
            case .failure(let error):
                self.logger.fault("Failed to fetch articles with error: \(error.localizedDescription)")
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleCell = tableView.dequeueReusableCell()
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
    
    private func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
