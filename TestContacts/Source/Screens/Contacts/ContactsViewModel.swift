//
//  ContactsViewModel.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import Foundation

protocol ContactsViewModel {
    /// Total amount of given contacts
    var contactsCount: Int { get }
    /// Callback action which will be call if some data in contact list did change
    var contactsListDidChande: (() -> Void)? { get set }
    /// Return specific contact data for given index in tableView
    func fetchContact(for index: Int) -> (fullName: String, email: String)
    /// Delete contact from saved list
    func removeContact(at index: Int)
    /// Navigate user to new viewController and show details about selected contact
    func showSingleContact(at index: Int)
    /// Return contacts list to the first lauched state
    func resetContactsList()
    /// Show new controller which allows to create and save new user
    func createNewContact()
}

final class ContactsViewModelImplementation: ContactsViewModel {
    private let initialContactsService: InitialContactsService
    private let storedContactsService: ContactsStorageService
    private let contactsProxyService: ContactsProxyService
    private var contacts: [Contact] = [] {
        didSet {
            contactsListDidChande?()
            updateStoredContacts()
        }
    }
    weak var coordinator: MainCoordinator?
    var contactsCount: Int { contacts.count }
    var contactsListDidChande: (() -> Void)?
    
    init(initialContactsService: InitialContactsService = AppDelegate.shared.context.initialContactsService,
         contactsProxyService: ContactsProxyService = AppDelegate.shared.context.contactsProxyService,
         storedContactsService: ContactsStorageService = AppDelegate.shared.context.storedContactsService) {
        self.initialContactsService = initialContactsService
        self.contactsProxyService = contactsProxyService
        self.storedContactsService = storedContactsService
        contacts = contactsProxyService.savedContacts()
    }
    
    func removeContact(at index: Int) {
        contacts.remove(at: index)
    }
    
    func resetContactsList() {
        contacts = initialContactsService.fetchAllContacts()
    }
    
    func fetchContact(for index: Int) -> (fullName: String, email: String) {
        let source = contacts[index]
        return ("\(source.name) \(source.lastName)", source.email)
    }
    
    func updateContact(_ contact: Contact, at index: Int) {
        contacts[index] = contact
    }
    
    func showSingleContact(at index: Int) {
        let source = contacts[index]
        coordinator?.showSingleContact(source, complition: { [weak self] savedContact in
            guard let self = self else { return }
            self.contacts[index] = savedContact
        })
    }
    
    func createNewContact() {
        let source = Contact(name: "", lastName: "", email: "", imageURL: "null")
        coordinator?.showSingleContact(source, complition: { [weak self] newContact in
            guard let self = self else { return }
            self.contacts.append(newContact)
        })
    }
    
    private func updateStoredContacts() {
        storedContactsService.saveContacts(contacts)
    }
}
