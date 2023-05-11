//
//  Network.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import Foundation

final class Network {
    
    static func fetchRequest<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                if let data = data {
                    let decodedJSON = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedJSON))
                }
            }
            catch {
                print("Decoder Error")
            }
        }
        task.resume()
        return task
    }
}
