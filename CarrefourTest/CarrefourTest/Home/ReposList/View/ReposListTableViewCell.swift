//
//  ReposListTableViewCell.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import UIKit

protocol ReposListTableViewCellProtocol: NSObject {
    func setCellData(data: RepositoryResponse)
}

class ReposListTableViewCell: UITableViewCell, ReposListTableViewCellProtocol {

    @IBOutlet weak var contentStackView: UIStackView!
    
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescriptionLabel: UILabel!
    @IBOutlet weak var repositoryLanguageLabel: UILabel!
    @IBOutlet weak var repositoryCardLanguageView: UIView!
    
    @IBOutlet var arrayLabel: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        repositoryCardLanguageView.layer.cornerRadius = 8
        repositoryCardLanguageView.applyCardShadow()
        selectionStyle = .none
    }
    
    func setCellData(data: RepositoryResponse) {
        repositoryNameLabel.text = data.full_name
        repositoryDescriptionLabel.text = data.description
        repositoryLanguageLabel.text = data.language
        
        hideEmptyValues()
    }
    
    override func prepareForReuse() {
        arrayLabel.forEach { $0.text = "" }
        repositoryLanguageLabel.text = ""
        
        contentStackView.arrangedSubviews.forEach { $0.isHidden = false }
    }
    
    private func hideEmptyValues() {
        arrayLabel.forEach { label in
            if label.text == nil ||
                label.text == "" {
                label.superview?.isHidden = true
            }
        }
        
        if repositoryLanguageLabel.text == nil ||
            repositoryLanguageLabel.text == "" {
            repositoryLanguageLabel.superview?.superview?.isHidden = true
        }
    }
}
