//
//  TextField.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

struct TextField {
    static func makeTextField(with placeholder : String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .unlessEditing
        textField.autocorrectionType = .no
        return textField
    }
}
