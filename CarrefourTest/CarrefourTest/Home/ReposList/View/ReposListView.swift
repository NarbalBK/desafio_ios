//
//  ReposListView.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import UIKit

final class ReposListView: UIView {
    
    let reusableIdentifier = "ReposListTableViewCell"
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModelDelegate: ReposListViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
    
    func commomInit() {
        Bundle.main.loadNibNamed("ReposListView", owner: self)
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
 
extension ReposListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelDelegate?.listRepositories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as? ReposListTableViewCell else { return UITableViewCell() }
        
        if let data = viewModelDelegate?.listRepositories[indexPath.row] {
            cell.setCellData(data: data)
        }
        
        tableView.layoutSubviews()
        
        return cell
    }
}
