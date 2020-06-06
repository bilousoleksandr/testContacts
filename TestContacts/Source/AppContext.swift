//
//  AppContext.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import Foundation

typealias AppContext = InitialContactsServiceHolder &
                        ContactsStorageServiceHolder &
                        ContactsProxyServiceHolder

struct Context: AppContext {
    let contactsProxyService: ContactsProxyService
    let storedContactsService: ContactsStorageService
    let initialContactsService: InitialContactsService
    
    static func context() -> Context {
        let storedContactsService = ContactsStorageServiceImplementation()
        let initialContactsService = InitialContactsServiceImplementation()
        let contactsProxyService = ContactsProxyServiceImplementation(initialContactsService: initialContactsService,
                                                                      storedContactsService: storedContactsService)
        
        return Context(contactsProxyService: contactsProxyService,
                       storedContactsService: storedContactsService,
                       initialContactsService: initialContactsService)
    }
}
