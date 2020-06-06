//
//  String.swift
//  TestContacts
//
//  Created by Marentilo on 06.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

extension String {
    static func attributedString(font: UIFont? = nil, textColor: UIColor? = nil) -> [NSAttributedString.Key: Any] {
        var attributedString: [NSAttributedString.Key: Any] = [:]
        if let newFont = font {
            attributedString[.font] = newFont
        }
        if let newColor = textColor {
            attributedString[.foregroundColor] = newColor
        }
        return attributedString
    }
}
