//
//  UserListView.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

protocol UserListViewDelegate: NSObject {
    var viewModelDelegate: UserListViewModelDelegate? { get set }
    
    func reloadData()
}

final class UserListView: UIView, UserListViewDelegate {
    
    let reusableIdentifier = "UserListTableViewCell"
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableMessageLabel: UILabel!
    
    var viewModelDelegate: UserListViewModelDelegate?
    
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
        searchBar.delegate = self
        
        tableView.register(UINib(nibName: reusableIdentifier, bundle: nil), forCellReuseIdentifier: reusableIdentifier)
        searchBar.placeholder = "Digite o nome do usuário..."
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableMessageLabel.isHidden = !(self.viewModelDelegate?.users.isEmpty ?? false)
        }
    }
}

extension UserListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelDelegate?.users.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as? UserListTableViewCell else { return UITableViewCell() }
        
        cell.startLoading()
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? UserListTableViewCell
        guard let urlData = viewModelDelegate?.users[indexPath.row].url else { return }
        _ = viewModelDelegate?.getUserDetail(url: urlData) { [weak self] userDetail in
            self?.viewModelDelegate?.goToUserProfile(profile: cell?.imageData, data: userDetail)
        }
    }
}

extension UserListView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModelDelegate?.getSomeUser(name: searchText)
    }
}
