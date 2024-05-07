//
//  ArticleCell.swift
//  SimpleArticles
//
//  Created by Will Saults on 5/6/24.
//

import UIKit

final class ArticleCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
