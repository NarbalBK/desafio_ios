//
//  UserListTableViewCell.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

protocol UserListTableViewCellProtocol: NSObject {
    var userDetailTask: URLSessionDataTask? { get set }
    var userImageTask: URLSessionDataTask? { get set }
    
    func startLoading()
    func setCellData(data: UserListCellModel)
    func setProfileImage(data: Data)
}

final class UserListTableViewCell: UITableViewCell, UserListTableViewCellProtocol {

    @IBOutlet weak var cardContentView: UIView!
    
    var userDetailTask: URLSessionDataTask?
    var userImageTask: URLSessionDataTask?
    
    var cellModel: UserListCellModel?
    var imageData: Data?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var numberOfReposLabel: UILabel!
    @IBOutlet weak var numberOfFollowersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 20
        selectionStyle = .none
    }
    
    func startLoading() {
        profileImageView.activityStartAnimating(activityColor: .gray, backgroundColor: .white)
    }
     
    func setCellData(data: UserListCellModel) {
        cellModel = data
        DispatchQueue.main.async {
            self.fullNameLabel.text = data.fullName
            self.nickNameLabel.text = data.nickName
            self.locationLabel.text = data.location
            self.numberOfReposLabel.text = data.reposFormated
            self.numberOfFollowersLabel.text = data.followersFormated
        }
    }
    
    func setProfileImage(data: Data) {
        imageData = data
        DispatchQueue.main.async {
            self.profileImageView.image = UIImage(data: data)
            self.profileImageView.activityStopAnimating()
        }
    }

    override func prepareForReuse() {
        profileImageView.image = UIImage()
        fullNameLabel.text = ""
        nickNameLabel.text = ""
        locationLabel.text = ""
        numberOfReposLabel.text = ""
        numberOfFollowersLabel.text = ""
        
        userDetailTask?.cancel()
        userImageTask?.cancel()
        
        userDetailTask = nil
        userImageTask = nil
        
        self.profileImageView.activityStopAnimating()
    }
}
