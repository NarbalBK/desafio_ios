//
//  UserProfileModel.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import Foundation

struct UserProfileModel {
    let profile: Data?
    let name: String?
    let login: String?
    let bio: String?
    let blog: String?
    let email: String?
    let location: String?
    let repos_url: String?
    let public_repos: Int?
    let followers: Int?
    let following: Int?
    
    var reposFormated: String? {
        public_repos == nil ? nil : "\(public_repos ?? 0)"
    }
    
    var followersFormated: String? {
        followers == nil ? nil : "\(followers ?? 0)"
    }
    
    var followingFormated: String? {
        following == nil ? nil : "\(following ?? 0)"
    }
    
    init(profile: Data?, name: String?, login: String?, bio: String?, blog: String?, email: String?, location: String?, repos_url: String?, public_repos: Int?, followers: Int?, following: Int?) {
        self.profile = profile
        self.name = name
        self.login = login
        self.bio = bio
        self.blog = blog
        self.email = email
        self.location = location
        self.repos_url = repos_url
        self.public_repos = public_repos
        self.followers = followers
        self.following = following
    }
    
    init(profile: Data?, data: UserDetailResponse) {
        self.profile = profile
        name = data.name
        login = data.login
        bio = data.bio
        blog = data.blog
        email = data.email
        location = data.location
        repos_url = data.repos_url
        public_repos = data.public_repos
        followers = data.followers
        following = data.following
    }
}
