//
//  UserProfileViewModel.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import Foundation

protocol UserProfileViewModelDelegate: NSObject {
    var view: UserProfileViewDelegate { get }
    var coordinatorDelegate: HomeCoordinatorDelegate { get }
    var viewData: UserProfileModel { get }
    
    func fillViewWithData()
    func goToReposityList()
}

final class UserProfileViewModel: NSObject, UserProfileViewModelDelegate {
    
    unowned let view: UserProfileViewDelegate
    unowned let coordinatorDelegate: HomeCoordinatorDelegate
    
    let viewData: UserProfileModel
    
    init (view: UserProfileViewDelegate, coordinator: HomeCoordinatorDelegate, data: UserProfileModel) {
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
