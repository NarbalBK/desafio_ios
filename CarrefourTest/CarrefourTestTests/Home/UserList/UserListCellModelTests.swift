//
//  UserListCellModelTests.swift
//  CarrefourTestTests
//
//  Created by Péricles Narbal on 13/05/23.
//

import XCTest
@testable import CarrefourTest

class UserListCellModelTests: XCTestCase {
    
    func testReposFormatted() {
        let model = UserListCellModel(fullName: "John Doe", nickName: "johndoe", location: "New York", repos: 10, followers: 20)
        XCTAssertEqual(model.reposFormated, "10")
        
        let modelWithNilRepos = UserListCellModel(fullName: "Jane Smith", nickName: "janesmith", location: "Los Angeles", repos: nil, followers: 15)
        XCTAssertNil(modelWithNilRepos.reposFormated)
    }
    
    func testFollowersFormatted() {
        let model = UserListCellModel(fullName: "John Doe", nickName: "johndoe", location: "New York", repos: 10, followers: 20)
        XCTAssertEqual(model.followersFormated, "20")
        
        let modelWithNilFollowers = UserListCellModel(fullName: "Jane Smith", nickName: "janesmith", location: "Los Angeles", repos: 5, followers: nil)
        XCTAssertNil(modelWithNilFollowers.followersFormated)
    }
    
    func testInitializationWithFullName() {
        let model = UserListCellModel(fullName: "John Doe", nickName: nil, location: nil, repos: nil, followers: nil)
        XCTAssertEqual(model.fullName, "John Doe")
        XCTAssertNil(model.nickName)
        XCTAssertNil(model.location)
        XCTAssertNil(model.repos)
        XCTAssertNil(model.followers)
        XCTAssertNil(model.reposFormated)
        XCTAssertNil(model.followersFormated)
    }
    
    func testInitializationWithData() {
        let data = UserDetailResponse(name: "User Name", login: "username", bio: "Software Developer", blog: "https://example.com/user_name", email: "user.name@example.com", location: "Fortaleza, CE", repos_url: "https://api.github.com/users/user_name/repos", public_repos: 10, followers: 100, following: 50)
        let model = UserListCellModel(data: data)
        XCTAssertEqual(model.fullName, "User Name")
        XCTAssertEqual(model.nickName, "username")
        XCTAssertEqual(model.location, "Fortaleza, CE")
        XCTAssertEqual(model.repos, 10)
        XCTAssertEqual(model.followers, 100)
        XCTAssertEqual(model.reposFormated, "10")
        XCTAssertEqual(model.followersFormated, "100")
    }
}

