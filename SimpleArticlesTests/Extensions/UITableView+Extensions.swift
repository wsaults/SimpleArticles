//
//  UITableView+Extensions.swift
//  SimpleArticlesTests
//
//  Created by Will Saults on 5/6/24.
//

import UIKit

extension UITableView {
    func rowCount(section: Int = 0) -> Int {
        numberOfRows(inSection: section)
    }
}
