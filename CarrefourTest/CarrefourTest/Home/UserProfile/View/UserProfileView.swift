//
//  UserProfileView.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import UIKit

final class UserProfileView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var cardContentView: UIView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var anyLinkLabel: UILabel!
    @IBOutlet weak var repositoriesLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var localeLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet var labelArray: [UILabel]!
    
    var viewModelDelegate: UserProfileViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
    
    func commomInit() {
        Bundle.main.loadNibNamed("UserProfileView", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        setupView()
    }
    
    private func setupView() {
        profileImageView.layer.cornerRadius = 64
        cardContentView.layer.cornerRadius = 20
        cardContentView.applyCardShadow()
    }
    
    func hideEmptyValues() {
        labelArray.forEach { label in
            if label.text == nil ||
                label.text == "" {
                label.superview?.isHidden = true
            }
        }
    }
    
    func setViewData(data: UserProfileModel) {
        profileImageView.image = UIImage(data: data.profile ?? Data())
        fullNameLabel.text = data.name
        nicknameLabel.text = data.login
        emailLabel.text = data.email
        anyLinkLabel.text = data.blog
        repositoriesLabel.text = data.reposFormated
        followersLabel.text = data.followersFormated
        followingLabel.text = data.followingFormated
        localeLabel.text = data.location
        bioLabel.text = data.bio
        
        hideEmptyValues()
    }
    
    @IBAction func repositoriesButtonAction(_ sender: Any) {
        viewModelDelegate?.goToReposityList()
    }

}
