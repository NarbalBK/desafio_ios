//
//  HomeRepository.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import Foundation

protocol HomeRepositoryProtocol {
    func getUsers(completion: @escaping (Result<[UserResponse], Error>) -> Void) -> URLSessionDataTask?
    func getUserDetail(url: String, completion: @escaping (Result<UserDetailResponse, Error>) -> Void) -> URLSessionDataTask?
    func getRepositories(url: String, completion: @escaping (Result<[RepositoryResponse], Error>) -> Void) -> URLSessionDataTask?
    func getSomeUserBy(name: String, completion: @escaping (Result<SearchUserResponse, Error>) -> Void) -> URLSessionDataTask?
    func getImageProfile(url: String, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask?
    func buildRequest(url: String) throws -> URLRequest
}

final class HomeRepository: HomeRepositoryProtocol {
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
