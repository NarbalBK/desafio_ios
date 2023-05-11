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
        
        if let url = URL(string: "https://api.github.com/users") {
            let task = Network.fetchRequest(url: url) { (result: Result<[User], Error>) in
                switch result {
                case .success(let objc):
                    print(objc)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

