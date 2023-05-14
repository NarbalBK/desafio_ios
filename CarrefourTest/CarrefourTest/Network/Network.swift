//
//  Network.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import Foundation

protocol NetworkProtocol {
    static func fetchRequestData(url: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask
    static func fetchRequest<T: Decodable>(url: URLRequest, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask
}

final class Network: NetworkProtocol {
    
    static func fetchRequestData(url: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse {
                print("STATUS CODE: \(response.statusCode) \(response.url?.absoluteString ?? "")")
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return task
    }
    
    static func fetchRequest<T: Decodable>(url: URLRequest, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask {
       
        let task = fetchRequestData(url: url) { result in
            do {
            switch result {
                case .success(let data):
                    let decodedJSON = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedJSON))
                case .failure(let error):
                    completion(.failure(error))
                }
            } catch {
                print("Decoder Error")
            }
        }
        return task
    }
}
