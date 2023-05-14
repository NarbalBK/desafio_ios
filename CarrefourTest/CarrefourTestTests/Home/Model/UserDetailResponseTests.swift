//
//  UserDetailResponseTests.swift
//  CarrefourTestTests
//
//  Created by Péricles Narbal on 13/05/23.
//

import XCTest
@testable import CarrefourTest

class UserDetailResponseTests: XCTestCase {

    func testUserDetailResponseDecoding() throws {
        let json = """
        {
            "name": "User Name",
            "login": "user_name",
            "bio": "Software Developer",
            "blog": "https://example.com/user_name",
            "email": "user.name@example.com",
            "location": "Fortaleza, CE",
            "repos_url": "https://api.github.com/users/user_name/repos",
            "public_repos": 10,
            "followers": 100,
            "following": 50
        }
        """
        
        let jsonData = json.data(using: .utf8)!
        let userDetailResponse = try JSONDecoder().decode(UserDetailResponse.self, from: jsonData)
        
        XCTAssertEqual(userDetailResponse.name, "User Name")
        XCTAssertEqual(userDetailResponse.login, "user_name")
        XCTAssertEqual(userDetailResponse.bio, "Software Developer")
        XCTAssertEqual(userDetailResponse.blog, "https://example.com/user_name")
        XCTAssertEqual(userDetailResponse.email, "user.name@example.com")
        XCTAssertEqual(userDetailResponse.location, "Fortaleza, CE")
        XCTAssertEqual(userDetailResponse.repos_url, "https://api.github.com/users/user_name/repos")
        XCTAssertEqual(userDetailResponse.public_repos, 10)
        XCTAssertEqual(userDetailResponse.followers, 100)
        XCTAssertEqual(userDetailResponse.following, 50)
    }
    
    func testUserDetailResponseMissingProperties() throws {
        let json = """
        {
            "name": "User Name",
            "login": "user_name"
        }
        """
        
        let jsonData = json.data(using: .utf8)!
        let userDetailResponse = try JSONDecoder().decode(UserDetailResponse.self, from: jsonData)
        
        XCTAssertEqual(userDetailResponse.name, "User Name")
        XCTAssertEqual(userDetailResponse.login, "user_name")
        XCTAssertNil(userDetailResponse.bio)
        XCTAssertNil(userDetailResponse.blog)
        XCTAssertNil(userDetailResponse.email)
        XCTAssertNil(userDetailResponse.location)
        XCTAssertNil(userDetailResponse.repos_url)
        XCTAssertNil(userDetailResponse.public_repos)
        XCTAssertNil(userDetailResponse.followers)
        XCTAssertNil(userDetailResponse.following)
    }
}

