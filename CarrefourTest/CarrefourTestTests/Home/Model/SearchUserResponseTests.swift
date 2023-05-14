//
//  SearchUserResponseTests.swift
//  CarrefourTestTests
//
//  Created by Péricles Narbal on 13/05/23.
//

import XCTest
@testable import CarrefourTest

class SearchUserResponseTests: XCTestCase {
    
    func testDecodeSearchUserResponse() throws {
        let json = """
        {
            "total_count": 2,
            "incomplete_results": false,
            "items": [
                {
                    "login": "john_doe",
                    "url": "https://example.com/john_doe",
                    "avatar_url": "https://example.com/avatar1.png"
                },
                {
                    "login": "jane_smith",
                    "url": "https://example.com/jane_smith",
                    "avatar_url": "https://example.com/avatar2.png"
                }
            ]
        }
        """
        
        let data = json.data(using: .utf8)!
        
        let searchUserResponse = try JSONDecoder().decode(SearchUserResponse.self, from: data)
        
        XCTAssertEqual(searchUserResponse.total_count, 2)
        XCTAssertEqual(searchUserResponse.incomplete_results, false)
        XCTAssertEqual(searchUserResponse.items.count, 2)
        
        let firstUser = searchUserResponse.items[0]
        XCTAssertEqual(firstUser.login, "john_doe")
        XCTAssertEqual(firstUser.url, "https://example.com/john_doe")
        XCTAssertEqual(firstUser.avatar_url, "https://example.com/avatar1.png")
        
        let secondUser = searchUserResponse.items[1]
        XCTAssertEqual(secondUser.login, "jane_smith")
        XCTAssertEqual(secondUser.url, "https://example.com/jane_smith")
        XCTAssertEqual(secondUser.avatar_url, "https://example.com/avatar2.png")
    }
}

