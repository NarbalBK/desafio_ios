//
//  HomeRepository.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import Foundation

final class HomeRepository {
    let baseUrl = "https://api.github.com/"
    let unwrapError = NSError(domain: "Unwrap Error", code: -1)
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) throws -> URLSessionDataTask {
        if let url = URL(string: baseUrl + "users") {
            let task = Network.fetchRequest(url: url) { result in
                completion(result)
            }
            return task
        }
        throw unwrapError
    }
    
    func getUserDetail(url: String, completion: @escaping (Result<UserDetail, Error>) -> Void) throws -> URLSessionDataTask {
        if let url = URL(string: url) {
            let task = Network.fetchRequest(url: url) { result in
                completion(result)
            }
            return task
        }
        throw unwrapError
    }
    
    func getImageProfile(url: String, completion: @escaping (Result<Data, Error>) -> Void) throws -> URLSessionDataTask {
        if let url = URL(string: url) {
            let task = Network.fetchRequestData(url: url) { result in
                completion(result)
            }
            return task
        }
        throw unwrapError
    }
}
