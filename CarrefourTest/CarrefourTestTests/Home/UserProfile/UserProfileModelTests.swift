//
//  UserProfileModelTests.swift
//  CarrefourTestTests
//
//  Created by Péricles Narbal on 13/05/23.
//

import XCTest
@testable import CarrefourTest

class UserProfileModelTests: XCTestCase {
    
    func testReposFormatted() {
        let model = UserProfileModel(profile: nil, name: "John Doe", login: "johndoe", bio: nil, blog: nil, email: nil, location: nil, repos_url: nil, public_repos: 10, followers: nil, following: nil)
        XCTAssertEqual(model.reposFormated, "10")
        
        let modelWithNilRepos = UserProfileModel(profile: nil, name: "Jane Smith", login: "janesmith", bio: nil, blog: nil, email: nil, location: nil, repos_url: nil, public_repos: nil, followers: 15, following: nil)
        XCTAssertNil(modelWithNilRepos.reposFormated)
    }
    
    func testFollowersFormatted() {
        let model = UserProfileModel(profile: nil, name: "John Doe", login: "johndoe", bio: nil, blog: nil, email: nil, location: nil, repos_url: nil, public_repos: nil, followers: 20, following: nil)
        XCTAssertEqual(model.followersFormated, "20")
        
        let modelWithNilFollowers = UserProfileModel(profile: nil, name: "Jane Smith", login: "janesmith", bio: nil, blog: nil, email: nil, location: nil, repos_url: nil, public_repos: 5, followers: nil, following: nil)
        XCTAssertNil(modelWithNilFollowers.followersFormated)
    }
    
    func testFollowingFormatted() {
        let model = UserProfileModel(profile: nil, name: "John Doe", login: "johndoe", bio: nil, blog: nil, email: nil, location: nil, repos_url: nil, public_repos: nil, followers: nil, following: 30)
        XCTAssertEqual(model.followingFormated, "30")
        
        let modelWithNilFollowing = UserProfileModel(profile: nil, name: "Jane Smith", login: "janesmith", bio: nil, blog: nil, email: nil, location: nil, repos_url: nil, public_repos: nil, followers: 15, following: nil)
        XCTAssertNil(modelWithNilFollowing.followingFormated)
    }
    
    func testInitializationWithProfile() {
        let profileData = "Profile Data".data(using: .utf8)
        let model = UserProfileModel(profile: profileData, name: "John Doe", login: nil, bio: nil, blog: nil, email: nil, location: nil, repos_url: nil, public_repos: nil, followers: nil, following: nil)
        
        XCTAssertEqual(model.profile, profileData)
        XCTAssertEqual(model.name, "John Doe")
        XCTAssertNil(model.login)
        XCTAssertNil(model.bio)
        XCTAssertNil(model.blog)
        XCTAssertNil(model.email)
        XCTAssertNil(model.location)
        XCTAssertNil(model.repos_url)
        XCTAssertNil(model.public_repos)
        XCTAssertNil(model.followers)
        XCTAssertNil(model.following)
        XCTAssertNil(model.reposFormated)
        XCTAssertNil(model.followersFormated)
        XCTAssertNil(model.followingFormated)
    }
    
    func testInitializationWithData() {
        let profileData = "Profile Data".data(using: .utf8)
        let data = UserDetailResponse(name: "Jane Smith", login: "janesmith", bio: "I'm a developer", blog: nil, email: nil, location: "Los Angeles", repos_url: "https://github.com/janesmith", public_repos: 5, followers: 15, following: 20)
        
        let model = UserProfileModel(profile: profileData, data: data)
        
        XCTAssertEqual(model.profile, profileData)
        XCTAssertEqual(model.name, "Jane Smith")
        XCTAssertEqual(model.login, "janesmith")
        XCTAssertEqual(model.bio, "I'm a developer")
        XCTAssertNil(model.blog)
        XCTAssertNil(model.email)
        XCTAssertEqual(model.location, "Los Angeles")
        XCTAssertEqual(model.repos_url, "https://github.com/janesmith")
        XCTAssertEqual(model.public_repos, 5)
        XCTAssertEqual(model.followers, 15)
        XCTAssertEqual(model.following, 20)
        XCTAssertEqual(model.reposFormated, "5")
        XCTAssertEqual(model.followersFormated, "15")
        XCTAssertEqual(model.followingFormated, "20")
    }
}


