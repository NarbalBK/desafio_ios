//
//  RepositoryResponseTests.swift
//  CarrefourTestTests
//
//  Created by Péricles Narbal on 13/05/23.
//

import XCTest
@testable import CarrefourTest

class RepositoryResponseTests: XCTestCase {
    func testDecodeRepositoryResponse() throws {
        let json = """
            {
                "name": "Repository Name",
                "full_name": "Full Repository Name",
                "description": "Repository Description",
                "language": "Swift"
            }
            """
        
        let data = json.data(using: .utf8)!
        let repositoryResponse = try JSONDecoder().decode(RepositoryResponse.self, from: data)
        
        XCTAssertEqual(repositoryResponse.name, "Repository Name")
        XCTAssertEqual(repositoryResponse.full_name, "Full Repository Name")
        XCTAssertEqual(repositoryResponse.description, "Repository Description")
        XCTAssertEqual(repositoryResponse.language, "Swift")
    }
    
    func testDecodeRepositoryResponseWithMissingFields() throws {
        let json = """
            {
                "name": "Repository Name",
                "full_name": "Full Repository Name"
            }
            """
        
        let data = json.data(using: .utf8)!
        let repositoryResponse = try JSONDecoder().decode(RepositoryResponse.self, from: data)
        
        XCTAssertEqual(repositoryResponse.name, "Repository Name")
        XCTAssertEqual(repositoryResponse.full_name, "Full Repository Name")
        XCTAssertNil(repositoryResponse.description)
        XCTAssertNil(repositoryResponse.language)
    }
}

