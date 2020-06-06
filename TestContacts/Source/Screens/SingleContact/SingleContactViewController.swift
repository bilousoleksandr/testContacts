//
//  SingleContactViewController.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

final class SingleContactViewController : UIViewController {
    private let viewModel: SingleContactViewModel
    private let avatarView = AvatarView()
    private let firstNameTextField = TextField.makeTextField(with: Strings.enterFirstName)
    private let lastNameTextField = TextField.makeTextField(with: Strings.enterLastName)
    private let emailTextField = TextField.makeTextField(with: Strings.enterEmail)
    
    init(viewModel: SingleContactViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = Strings.edit
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configure()
    }
    
    private func setupView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonDidPressed(sender:)))
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        [avatarView, firstNameTextField, lastNameTextField, emailTextField].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [firstNameTextField, lastNameTextField, emailTextField].forEach { $0.delegate = self }
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: StyleGuide.Space.double),
            avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: StyleGuide.ImageSize.size),
            avatarView.widthAnchor.constraint(equalToConstant: StyleGuide.ImageSize.size),
            
            firstNameTextField.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: StyleGuide.Space.double),
            firstNameTextField.heightAnchor.constraint(equalToConstant: StyleGuide.Space.double * 3),
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: StyleGuide.Space.double),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -StyleGuide.Space.double),
            
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: StyleGuide.Space.double),
            lastNameTextField.heightAnchor.constraint(equalToConstant: StyleGuide.Space.double * 3),
            lastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: StyleGuide.Space.double),
            lastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -StyleGuide.Space.double),
            
            emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: StyleGuide.Space.double),
            emailTextField.heightAnchor.constraint(equalToConstant: StyleGuide.Space.double * 3),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: StyleGuide.Space.double),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -StyleGuide.Space.double)
        ])
    }
    
    private func configure() {
        avatarView.configure(image: viewModel.contactImage)
        firstNameTextField.text = viewModel.firstName
        lastNameTextField.text = viewModel.lastName
        emailTextField.text = viewModel.email
    }
    
    private func saveEventHandler() {
        let textArray = [firstNameTextField, lastNameTextField, emailTextField].compactMap { $0.text?.count }.filter { $0 == 0}
        if textArray.isEmpty {
            viewModel.saveChanges(firstName: firstNameTextField.text, lastName: lastNameTextField.text, email: emailTextField.text)
            navigationController?.popViewController(animated: true)
        } else {
            highlightTextField()
        }
    }
    
    private func highlightTextField() {
        let fields = [firstNameTextField, lastNameTextField, emailTextField].filter { $0.text == nil || $0.text?.count == 0 }
        fields.forEach { $0.attributedPlaceholder = NSAttributedString(string: $0.placeholder ?? "",
                                                                       attributes: String.attributedString(font: UIFont.systemFont(ofSize: 16),
                                                                                                           textColor: .red))}
    }
}

// MARK: - Actions -
@objc
private extension SingleContactViewController {
    func saveButtonDidPressed(sender: UIBarButtonItem) {
        saveEventHandler()
    }
}

// MARK: - UITextFieldDelegate -
extension SingleContactViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
