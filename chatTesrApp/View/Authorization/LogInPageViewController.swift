//
//  LogInPageViewController.swift
//  chatTesrApp
//
//  Created by admin1 on 23.03.23.
//

import UIKit

final class LogInPageViewController: UIViewController{
    
    weak var coordinator: AppCoordinator?
    
    let textLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        lable.textColor = Resouces.Colors.text
        lable.text = "Welcom back"
        return lable
    }()
    
    let textFieldPhoneNumber: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.backgroundColor = Resouces.Colors.textFieldColorbg
        textField.attributedPlaceholder = NSAttributedString(string: "Phone Number",
                                                             attributes: [.foregroundColor: Resouces.Colors.textFieldColorText])
        return textField
    }()
    
    let buttonLogIn: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resouces.Colors.btnColor
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .white
        
        buttonLogIn.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action
    @objc func loginUser() {
        let alertController = UIAlertController(title: "Enter a code", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                 print(text)
            }
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Cod"
        }
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Configure
    private func configure() {
        [textLable,
         textFieldPhoneNumber,
        buttonLogIn].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            textLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            textLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textFieldPhoneNumber.widthAnchor.constraint(equalToConstant: 290),
            textFieldPhoneNumber.heightAnchor.constraint(equalToConstant: 30),
            textFieldPhoneNumber.topAnchor.constraint(equalTo: textLable.bottomAnchor, constant: 160),
            textFieldPhoneNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonLogIn.widthAnchor.constraint(equalToConstant: 290),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 46),
            buttonLogIn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonLogIn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
}
