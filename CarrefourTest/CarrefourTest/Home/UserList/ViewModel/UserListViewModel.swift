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
    
    var users: [UserResponse] = []
    
    private let cache = NSCache<NSString, AnyObject>()
    
    init (view: UserListView, coordinator: HomeCoordinator, repository: HomeRepository) {
        self.view = view
        coordinatorDelegate = coordinator
        self.repository = repository
        super.init()
        
        getUsers()
    }
    
    func getUsers() {
        _ = repository.getUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                self?.view.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getSomeUser(name: String) {
        if name.count < 3 || name.count > 30 {
            return
        }
        
        let formattedName = name.trimmingCharacters(in: .whitespaces)
            .folding(options: .diacriticInsensitive, locale: .current)
            .replacingOccurrences(of: " ", with: "_")
        
        if let cachedData = cache.object(forKey: formattedName as NSString) as? [UserResponse] {
            users = cachedData
            view.reloadData()
            return
        }
        
        _ = repository.getSomeUserBy(name: formattedName) { [weak self] result in
            switch result {
            case .success(let search):
                self?.cache.setObject(search.items as AnyObject, forKey: formattedName as NSString)
                self?.users = search.items
                self?.view.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUserDetail(url: String, completion: @escaping (UserDetailResponse) -> Void) -> URLSessionDataTask? {
        if let cachedData = cache.object(forKey: url as NSString) as? UserDetailResponse {
            completion(cachedData)
            return nil
        }
        
        let task = repository.getUserDetail(url: url) { [weak self] result in
            switch result {
            case .success(let userDetail):
                self?.cache.setObject(userDetail as AnyObject, forKey: url as NSString)
                completion(userDetail)
            case .failure(let error):
                print(error)
            }
        }
        return task
    }
    
    func getImageProfile(url: String, completion: @escaping (Data) -> Void) -> URLSessionDataTask? {
        if let cachedImage = cache.object(forKey: url as NSString) as? Data {
            completion(cachedImage)
            return nil
        }
        
        let task = repository.getImageProfile(url: url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.cache.setObject(NSData(data: imageData), forKey: url as NSString)
                completion(imageData)
            case .failure(let error):
                print(error)
            }
        }
        return task
    }
    
    func goToUserProfile(profile: Data?, data: UserDetailResponse) {
        let userProfile = UserProfileModel(profile: profile, data: data)
        coordinatorDelegate.goToUserProfile(data: userProfile)
    }
}
