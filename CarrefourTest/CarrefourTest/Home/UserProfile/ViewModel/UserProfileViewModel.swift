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
    
    let viewData: UserProfileModel
    
    init (view: UserProfileView, coordinator: HomeCoordinator, data: UserProfileModel) {
        self.view = view
        coordinatorDelegate = coordinator
        viewData = data
        super.init()
        
        view.viewModelDelegate = self
        fillViewWithData()
    }
    
    func fillViewWithData() {
        view.setViewData(data: viewData)
    }
    
    func goToReposityList() {
        coordinatorDelegate.goToRepositoryList(data: viewData)
    }
}
