//
//  XCTestCase+Extensions.swift
//  SimpleArticlesTests
//
//  Created by Will Saults on 5/6/24.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
    
    func anyNSError() -> NSError {
        NSError(domain: "any error", code: 0)
    }
}
