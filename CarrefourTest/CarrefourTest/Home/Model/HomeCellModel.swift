//
//  HomeCellModel.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import Foundation

struct HomeCellModel {
    let fullName: String?
    let nickName: String?
    let location: String?
    let repos: Int?
    let followers: Int?
    
    var reposFormated: String? {
        repos == nil ? nil : "\(repos ?? 0)"
    }
    
    var followersFormated: String? {
        followers == nil ? nil : "\(followers ?? 0)"
    }
    
    init(fullName: String?, nickName: String?, location: String?, repos: Int?, followers: Int?) {
        self.fullName = fullName
        self.nickName = nickName
        self.location = location
        self.repos = repos
        self.followers = followers
    }
    
    init(data: UserDetail) {
        fullName = data.name
        nickName = data.login
        location = data.location
        repos = data.public_repos
        followers = data.followers
    }
}
