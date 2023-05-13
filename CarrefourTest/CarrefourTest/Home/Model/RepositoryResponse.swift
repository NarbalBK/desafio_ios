//
//  RepositoryResponse.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import Foundation

struct RepositoryResponse: Decodable {
    let name: String?
    let full_name: String?
    let description: String?
    let language: String?
}
