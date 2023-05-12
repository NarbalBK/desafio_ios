//
//  HomeTableViewCell.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cardContentView: UIView!
    
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
    
    func setCellData(data: HomeCellModel) {
        fullNameLabel.text = data.fullName
        nickNameLabel.text = data.nickName
        locationLabel.text = data.location
        numberOfReposLabel.text = "\(data.repos)"
        numberOfFollowersLabel.text = "\(data.followers)"
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
    }
}
