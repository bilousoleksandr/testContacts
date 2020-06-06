//
//  ContactsProxyService.swift
//  TestContacts
//
//  Created by Marentilo on 06.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import Foundation

protocol ContactsProxyServiceHolder {
    var contactsProxyService: ContactsProxyService { get }
}

protocol ContactsProxyService {
    /// Return saved contacts (even empty) if exist or initial value
    func savedContacts() -> [Contact]
}

final class ContactsProxyServiceImplementation: ContactsProxyService {
    private let initialContactsService: InitialContactsService
    private let storedContactsService: ContactsStorageService
    
    init(initialContactsService: InitialContactsService, storedContactsService: ContactsStorageService) {
        self.initialContactsService = initialContactsService
        self.storedContactsService = storedContactsService
    }
    
    func savedContacts() -> [Contact] {
        guard let storedContacts = storedContactsService.fetchContacts() else {
            return initialContactsService.fetchAllContacts()
        }
        return storedContacts
    }
}
