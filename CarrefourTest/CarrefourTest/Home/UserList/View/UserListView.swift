//
//  UserListView.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

final class UserListView: UIView {
    
    let reusableIdentifier = "UserListTableViewCell"
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModelDelegate: UserListViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
    
    func commomInit() {
        Bundle.main.loadNibNamed("UserListView", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        setupView()
    }
    
    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: reusableIdentifier, bundle: nil), forCellReuseIdentifier: reusableIdentifier)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension UserListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelDelegate?.users.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as? UserListTableViewCell else { return UITableViewCell() }
        
        if let urlData = viewModelDelegate?.users[indexPath.row].url {
            cell.userDetailTask = viewModelDelegate?.getUserDetail(url: urlData) { userDetail in
                cell.setCellData(data: UserListCellModel(data: userDetail))
            }
        }
        
        if let urlImage = viewModelDelegate?.users[indexPath.row].avatar_url {
            cell.userImageTask = viewModelDelegate?.getImageProfile(url: urlImage) { imageData in
                cell.setProfileImage(data: imageData)
            }
        }
        
        return cell
    }
}
