//
//  InitialContactsService.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import Foundation

protocol InitialContactsServiceHolder {
    var initialContactsService : InitialContactsService { get }
}

protocol InitialContactsService {
    func fetchAllContacts() -> [Contact]
}

final class InitialContactsServiceImplementation : InitialContactsService {
    func fetchAllContacts() -> [Contact] {
        guard let path = Bundle.main.path(forResource: "Contacts", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
            let contactList = Serializer.deserialize(data, type: ContactList.self) else {
            return [Contact]()
        }
        return contactList.contacts
    }
}
