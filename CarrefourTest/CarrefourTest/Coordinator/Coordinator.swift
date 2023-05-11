//
//  Coordinator.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

protocol Coordinator: NSObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}

