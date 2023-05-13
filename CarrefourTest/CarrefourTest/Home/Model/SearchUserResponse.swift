//
//  SearchUserResponse.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 13/05/23.
//

import Foundation

struct SearchUserResponse: Decodable {
    let total_count: Int?
    let incomplete_results: Bool?
    let items: [UserResponse]
}
