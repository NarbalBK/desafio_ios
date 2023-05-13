//
//  UserDetail.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import Foundation

struct UserDetailResponse: Decodable {
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
}
