//
//  UserProfileViewModel.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import Foundation

final class UserProfileViewModel: NSObject {
    
    unowned let view: UserProfileView
    unowned let coordinatorDelegate: HomeCoordinator
    
    let repository: HomeRepository
    let viewData: UserProfileModel
    
    init (view: UserProfileView, coordinator: HomeCoordinator, repository: HomeRepository, data: UserProfileModel) {
        self.view = view
        coordinatorDelegate = coordinator
        self.repository = repository
        viewData = data
        super.init()
        
        fillViewWithData()
    }
    
    func fillViewWithData() {
        view.setViewData(data: viewData)
    }
}
