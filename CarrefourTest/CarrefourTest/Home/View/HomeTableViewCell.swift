//
//  HomeTableViewCell.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cardContentView: UIView!
    
    weak var viewModelDelegate: HomeViewModel?
    
    var userDetailTask: URLSessionDataTask?
    var cellModel: HomeCellModel?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var numberOfReposLabel: UILabel!
    @IBOutlet weak var numberOfFollowersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCellData(url: String) {
        userDetailTask = viewModelDelegate?.getUserDetail(url: url) { [weak self] userDetail in
            guard let weakself = self else { return }
            weakself.cellModel = HomeCellModel(data: userDetail)
            
            DispatchQueue.main.async {
                weakself.fullNameLabel.text = weakself.cellModel?.fullName
                weakself.nickNameLabel.text = weakself.cellModel?.nickName
                weakself.locationLabel.text = weakself.cellModel?.location
                weakself.numberOfReposLabel.text = weakself.cellModel?.reposFormated
                weakself.numberOfFollowersLabel.text = weakself.cellModel?.followersFormated
            }
        }
    }
    
    func setProfileImage() {
        
    }

    override func prepareForReuse() {
        profileImageView.image = UIImage()
        fullNameLabel.text = ""
        nickNameLabel.text = ""
        locationLabel.text = ""
        numberOfReposLabel.text = ""
        numberOfFollowersLabel.text = ""
        
        userDetailTask?.cancel()
        userDetailTask = nil
    }
}
