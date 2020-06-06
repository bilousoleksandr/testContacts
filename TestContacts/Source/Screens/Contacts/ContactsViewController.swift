//
//  ViewController.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

class ContactsViewController: UITableViewController {
    private var viewModel: ContactsViewModel
    private lazy var refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                     target: self,
                                                     action: #selector(refreshButtonDidPress(sender:)))
    private lazy var addContactButton = UIBarButtonItem(barButtonSystemItem: .add,
                                                        target: self,
                                                        action: #selector(addButtonDidPress(sender:)))
    
    init(viewModel: ContactsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = Strings.contacts
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerReusableCell(ContactTableViewCell.self)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = addContactButton
        navigationItem.rightBarButtonItem = refreshButton
        viewModel.contactsListDidChande = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - Actions
@objc extension ContactsViewController {
    func refreshButtonDidPress(sender: UIBarButtonItem) {
        viewModel.resetContactsList()
    }
    
    func addButtonDidPress(sender: UIBarButtonItem) {
        viewModel.createNewContact()
    }
}

// MARK: - UITableViewDataSource -
extension ContactsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contactsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellItem = tableView.dequeueReusableCell(ContactTableViewCell.self)  else { fatalError() }
        let contactData = viewModel.fetchContact(for: indexPath.row)
        cellItem.configure(fullName: contactData.fullName, email: contactData.email)
        return cellItem
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        viewModel.removeContact(at: indexPath.row)
    }
}

// MARK: - UITableViewDeledate -
extension ContactsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.showSingleContact(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

