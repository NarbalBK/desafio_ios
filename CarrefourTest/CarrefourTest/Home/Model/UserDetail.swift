//
//  UserDetail.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import Foundation

struct UserDetail: Decodable {
    let name: String?
    let login: String?
    let location: String?
    let public_repos: Int?
    let followers: Int?
}
