//
//  Strings.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import Foundation

class Strings {
    static let enterEmail = Strings.tr("Localizable", key: "enterEmail")
    static let enterFirstName = Strings.tr("Localizable", key: "enterFirstName")
    static let enterLastName = Strings.tr("Localizable", key: "enterLastName")
    static let contacts = Strings.tr("Localizable", key: "contacts")
    static let edit = Strings.tr("Localizable", key: "edit")
}

extension Strings {
    static func tr(_ table : String, key : String, args : CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: table, bundle: Bundle.main, value: "", comment: "")
        let result = String(format: format, locale: Locale.current, arguments: args)
        return result
    }
}
