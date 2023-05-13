//
//  ReposListViewModel.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import UIKit

final class ReposListViewModel: NSObject, ControllerLifeCicleDelegate {
    
    unowned let view: ReposListView
    unowned let coordinatorDelegate: HomeCoordinator
    
    let repository: HomeRepository
    let profileData: UserProfileModel
    
    var listRepositories: [RepositoryResponse] = []
    
    init (view: ReposListView, coordinator: HomeCoordinator, repository: HomeRepository, data: UserProfileModel) {
        self.view = view
        coordinatorDelegate = coordinator
        self.repository = repository
        self.profileData = data
        super.init()
        
        view.viewModelDelegate = self
    }
    
    func viewDidLoad() {
        if let url = profileData.repos_url {
            getRepositories(url: url)
        }
    }
    
    func getRepositories(url: String) {
        view.addActivity()
        _ = repository.getRepositories(url: url) { [weak self] result in
            self?.view.removeActivity()
            switch result {
            case .success(let listRepositories):
                self?.listRepositories = listRepositories
                self?.view.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
