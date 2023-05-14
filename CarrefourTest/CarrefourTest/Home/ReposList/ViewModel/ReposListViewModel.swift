//
//  ReposListViewModel.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import UIKit

protocol ReposListViewModelDelegate: NSObject {
    var view: ReposListViewDelegate { get }
    var coordinatorDelegate: HomeCoordinatorDelegate { get }
    var repository: HomeRepositoryProtocol { get }
    var listRepositories: [RepositoryResponse] { get set }
    
    func getRepositories(url: String)
}

final class ReposListViewModel: NSObject, ReposListViewModelDelegate, ControllerLifeCicleDelegate {
    
    unowned let view: ReposListViewDelegate
    unowned let coordinatorDelegate: HomeCoordinatorDelegate
    
    let repository: HomeRepositoryProtocol
    let profileData: UserProfileModel
    
    var listRepositories: [RepositoryResponse] = []
    
    init (view: ReposListViewDelegate, coordinator: HomeCoordinatorDelegate, repository: HomeRepositoryProtocol, data: UserProfileModel) {
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
