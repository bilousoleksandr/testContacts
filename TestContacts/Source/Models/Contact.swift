//
//  Contact.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import Foundation

// MARK: - Contact
struct Contact : Codable {
    let name: String
    let lastName: String
    let email: String
    let imageURL: String
    
    enum CodingKeys : String, CodingKey {
        case name, lastName, email, imageURL
    }
}
