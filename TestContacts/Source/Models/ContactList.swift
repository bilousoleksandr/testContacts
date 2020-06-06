//
//  ContactList.swift
//  TestContacts
//
//  Created by Marentilo on 06.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import Foundation

// MARK: - ContactList
struct ContactList : Codable {
    let contacts : [Contact]
    
    enum CodingKeys : String, CodingKey {
        case contacts
    }
}
