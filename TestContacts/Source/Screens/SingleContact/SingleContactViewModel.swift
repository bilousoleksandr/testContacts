//
//  SingleContactViewModel.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

protocol SingleContactViewModel {
    /// Current image for contact
    var contactImage: UIImage? { get }
    /// Callback action to update changed contact data
    var complition: ((Contact) -> Void)? { get }
    /// Contact email
    var email: String { get }
    /// Contact first name
    var firstName: String { get }
    /// Contact last name
    var lastName: String { get }
    /// Activate callback to save changes in main list
    func saveChanges(firstName: String?, lastName: String?, email: String?)
}

final class SingleContactViewModelImplementation: SingleContactViewModel {
    private let contact: Contact
    
    var complition: ((Contact) -> Void)?
    var email: String { contact.email }
    var firstName: String { contact.name }
    var lastName: String { contact.lastName }
    var contactImage: UIImage? { UIImage(named: contact.imageURL)}
    
    init(contact: Contact, complition: ((Contact) -> Void)?) {
        self.contact = contact
        self.complition = complition
    }
    
    func saveChanges(firstName: String?, lastName: String?, email: String?) {
        guard let newFirstName = firstName, let newLastName = lastName, let newEmail = email else { return }
        let newContact = Contact(name: newFirstName, lastName: newLastName, email: newEmail, imageURL: contact.imageURL)
        complition?(newContact)
    }
}
