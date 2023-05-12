//
//  HomeCellModel.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import Foundation

struct HomeCellModel: Decodable {
    let fullName: String
    let nickName: String
    let location: String
    let repos: Int
    let followers: Int
    
    enum CodingKeys: String, CodingKey {
        case fullName = "name"
        case nickName = "login"
        case location = "location"
        case repos = "public_repos"
        case followers = "followers"
    }
}
