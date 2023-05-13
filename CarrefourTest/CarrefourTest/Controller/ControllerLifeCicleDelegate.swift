//
//  ControllerLifeCicle.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 13/05/23.
//

import Foundation

protocol ControllerLifeCicleDelegate: NSObject {
    func loadView()
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

extension ControllerLifeCicleDelegate {
    func loadView() {
        // Intentionally empty.
    }
    
    func viewDidLoad() {
        // Intentionally empty.
    }
    
    func viewWillAppear(_ animated: Bool) {
        // Intentionally empty.
    }
    
    func viewDidAppear(_ animated: Bool) {
        // Intentionally empty.
    }
    
    func viewWillDisappear(_ animated: Bool) {
        // Intentionally empty.
    }
    
    func viewDidDisappear(_ animated: Bool) {
        // Intentionally empty.
    }
}
