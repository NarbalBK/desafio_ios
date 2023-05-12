//
//  UserListViewModel.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import Foundation

final class UserListViewModel: NSObject {
    
    unowned let view: UserListView
    unowned let coordinatorDelegate: HomeCoordinator
    
    let repository: HomeRepository
    
    var users: [User] = []
    
    private let cache = NSCache<NSString, AnyObject>()
    
    init (view: UserListView, coordinator: HomeCoordinator, repository: HomeRepository) {
        self.view = view
        coordinatorDelegate = coordinator
        self.repository = repository
        super.init()
        
        getUsers()
    }
    
    func getUsers() {
        do {
            _ = try repository.getUsers { [weak self] result in
                switch result {
                case .success(let users):
                    self?.users = users
                    self?.view.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
    
    func getUserDetail(url: String, completion: @escaping (UserDetail) -> Void) -> URLSessionDataTask? {
        if let cachedData = cache.object(forKey: url as NSString) as? UserDetail {
            completion(cachedData)
            return nil
        }
        
        do {
            let task = try repository.getUserDetail(url: url) { [weak self] result in
                switch result {
                case .success(let userDetail):
                    self?.cache.setObject(userDetail as AnyObject, forKey: url as NSString)
                    completion(userDetail)
                case .failure(let error):
                    print(error)
                }
            }
            return task
        } catch {
            print(error)
        }
        return nil
    }
    
    func getImageProfile(url: String, completion: @escaping (Data) -> Void) -> URLSessionDataTask? {
        if let cachedImage = cache.object(forKey: url as NSString) as? Data {
            completion(cachedImage)
            return nil
        }
        
        do {
            let task = try repository.getImageProfile(url: url) { [weak self] result in
                switch result {
                case .success(let imageData):
                    self?.cache.setObject(NSData(data: imageData), forKey: url as NSString)
                    completion(imageData)
                case .failure(let error):
                    print(error)
                }
            }
            return task
        } catch {
            print(error)
        }
        return nil
    }
}
