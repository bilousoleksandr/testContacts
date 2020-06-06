//
//  ContactsStorageService.swift
//  TestContacts
//
//  Created by Marentilo on 06.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import Foundation

protocol ContactsStorageServiceHolder {
    var storedContactsService: ContactsStorageService { get }
}

protocol ContactsStorageService {
    /// Return saved contacts list if data exist
    func fetchContacts() -> [Contact]?
    /// Save given contacts on disk as data
    func saveContacts(_ contacts: [Contact])
}

final class ContactsStorageServiceImplementation: ContactsStorageService {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    func fetchContacts() -> [Contact]? {
        guard let data = userDefaults.value(forKey: StoringKeys.contactsData) as? Data,
            let contactsList = Serializer.deserialize(data, type: ContactList.self) else {
                return nil
        }
        return contactsList.contacts
    }
    
    func saveContacts(_ contacts: [Contact]) {
        let contactsList = ContactList(contacts: contacts)
        if let data = Serializer.serialize(contactsList) {
            userDefaults.set(data, forKey: StoringKeys.contactsData)
        }
    }
}

private extension ContactsStorageServiceImplementation {
    enum StoringKeys {
        static let contactsData = "ContactsData"
    }
}
