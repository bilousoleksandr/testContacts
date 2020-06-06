//
//  ContactTableViewCell.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

final class ContactTableViewCell : UITableViewCell {
    private let fullNameLabel = Label.makeFullnameLabel()
    private let emailLabel = Label.makeEmailLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fullNameLabel.text = nil
        emailLabel.text = nil
    }
    
    private func setupView() {
        [fullNameLabel, emailLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: StyleGuide.Space.single),
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: StyleGuide.Space.double),
            fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -StyleGuide.Space.double),
            
            emailLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: StyleGuide.Space.single),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: StyleGuide.Space.double),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -StyleGuide.Space.double),
            emailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -StyleGuide.Space.single)
        ])
    }
    
    func configure(fullName : String, email : String) {
        fullNameLabel.text = fullName
        emailLabel.text = email
    }
}
