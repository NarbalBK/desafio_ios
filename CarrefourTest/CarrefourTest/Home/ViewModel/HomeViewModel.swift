//
//  HomeViewModel.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import Foundation

final class HomeViewModel: NSObject {
    
    unowned let view: HomeView
    unowned let coordinatorDelegate: HomeCoordinator
    
    let repository: HomeRepository
    
    var users: [User] = []
    
    init (view: HomeView, coordinator: HomeCoordinator, repository: HomeRepository) {
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
        do {
            let task = try repository.getUserDetail(url: url) { result in
                switch result {
                case .success(let userDetail):
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
    
    deinit {
        print("FOI DESALOCADO")
    }
}
