//
//  UserResponseTests.swift
//  CarrefourTestTests
//
//  Created by Péricles Narbal on 13/05/23.
//

import XCTest
@testable import CarrefourTest

class UserResponseTests: XCTestCase {

    func testUserResponseDecoding() throws {
        let json = """
        {
            "login": "user_test",
            "url": "https://example.com/user_test",
            "avatar_url": "https://example.com/avatar/user_test.jpg"
        }
        """
        
        let jsonData = json.data(using: .utf8)!
        let userResponse = try JSONDecoder().decode(UserResponse.self, from: jsonData)
        
        XCTAssertEqual(userResponse.login, "user_test")
        XCTAssertEqual(userResponse.url, "https://example.com/user_test")
        XCTAssertEqual(userResponse.avatar_url, "https://example.com/avatar/user_test.jpg")
    }
}

