//
//  ViewController.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        let repository = HomeRepository()
        let task = try? repository.getUsers { result in
            switch result {
            case .success(let objc):
                print(objc)
            case .failure(let error):
                print(error)
            }
        }
    }
}

