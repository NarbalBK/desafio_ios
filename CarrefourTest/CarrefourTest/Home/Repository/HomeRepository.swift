//
//  HomeRepository.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import Foundation

final class HomeRepository {
    let baseUrl = "https://api.github.com/"
    let token = "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"
    
    let unwrapError = NSError(domain: "Unwrap Error", code: -1)
    
    func getUsers(completion: @escaping (Result<[UserResponse], Error>) -> Void) -> URLSessionDataTask? {
        let url = baseUrl + "users"
        
        do {
            let urlRequest = try buildRequest(url: url)
            let task = Network.fetchRequest(url: urlRequest) { result in
                completion(result)
            }
            return task
        } catch {
            completion(.failure(error))
            return nil
        }
    }
    
    func getUserDetail(url: String, completion: @escaping (Result<UserDetailResponse, Error>) -> Void) -> URLSessionDataTask? {
        do {
            let urlRequest = try buildRequest(url: url)
            let task = Network.fetchRequest(url: urlRequest) { result in
                completion(result)
            }
            return task
        } catch {
            completion(.failure(error))
            return nil
        }
    }
    
    func getRepositories(url: String, completion: @escaping (Result<[RepositoryResponse], Error>) -> Void) -> URLSessionDataTask? {
        do {
            let urlRequest = try buildRequest(url: url)
            let task = Network.fetchRequest(url: urlRequest) { result in
                completion(result)
            }
            return task
        } catch {
            completion(.failure(error))
            return nil
        }
    }
    
    func getSomeUserBy(name: String, completion: @escaping (Result<SearchUserResponse, Error>) -> Void) -> URLSessionDataTask? {
        let url = baseUrl + "search/users?q=\(name)"
        do {
            let urlRequest = try buildRequest(url: url)
            let task = Network.fetchRequest(url: urlRequest) { result in
                completion(result)
            }
            return task
        } catch {
            completion(.failure(error))
            return nil
        }
    }
    
    func getImageProfile(url: String, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask? {
        do {
            let urlRequest = try buildRequest(url: url)
            let task = Network.fetchRequestData(url: urlRequest) { result in
                completion(result)
            }
            return task
        } catch {
            completion(.failure(error))
            return nil
        }
    }
    
    func buildRequest(url: String) throws -> URLRequest {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            return request
        }
        throw unwrapError
    }
}
