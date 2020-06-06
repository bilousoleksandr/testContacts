//
//  RoundedAvatar.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

final class AvatarView : UIView {
    private let borderWidth : CGFloat
    private let avatarImageView : UIImageView
    
    init(borderWidth : CGFloat = 5) {
        self.borderWidth = borderWidth
        self.avatarImageView = UIImageView()
        super.init(frame: .zero)
        addSubview(avatarImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.frame = bounds
        avatarImageView.layer.masksToBounds = false
        avatarImageView.layer.cornerRadius = frame.height / 2
        avatarImageView.layer.borderWidth = borderWidth
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.clipsToBounds = true
    }
    
    func configure (image : UIImage?) {
        avatarImageView.image = image
    }
}
