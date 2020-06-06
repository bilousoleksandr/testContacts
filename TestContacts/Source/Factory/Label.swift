//
//  Label.swift
//  TestContacts
//
//  Created by Marentilo on 06.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

struct Label {
    static func makeFullnameLabel() -> UILabel {
        UILabel()
            .font(Font.rowTitle.uiFont)
            .color(.black)
            .alignment(.left)
    }
    
    static func makeEmailLabel() -> UILabel {
        UILabel()
            .font(Font.rowSubtitle.uiFont)
            .color(.gray)
            .alignment(.left)
    }
}

// MARK: - UILabel Extension -
extension UILabel {
    func font(_ fnt: UIFont) -> UILabel {
        font = fnt
        return self
    }
    
    func color(_ clr: UIColor) -> UILabel {
        textColor = clr
        return self
    }
    
    func alignment(_ algn: NSTextAlignment) -> UILabel {
        textAlignment = algn
        return self
    }
}
