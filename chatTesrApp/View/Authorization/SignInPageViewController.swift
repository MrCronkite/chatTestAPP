//
//  SingInPageViewController.swift
//  chatTesrApp
//
//  Created by admin1 on 23.03.23.
//

import UIKit

final class SignInPageViewController: UIViewController{
    
    weak var coordinator: AppCoordinator?
    
    let textLable: UILabel = {
        let lable = UILabel()
        lable.font = .robotoRegular(size: 30)
        lable.textColor = Resouces.Colors.text
        lable.text = "Sign in"
        return lable
    }()
    
    let textFieldName: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.backgroundColor = Resouces.Colors.textFieldColorbg
        textField.attributedPlaceholder = NSAttributedString(string: "Name",
                                                             attributes: [.foregroundColor: Resouces.Colors.textFieldColorText])
        return textField
    }()
    
    let textFieldUsername: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.backgroundColor = Resouces.Colors.textFieldColorbg
        textField.attributedPlaceholder = NSAttributedString(string: "Username",
                                                             attributes: [.foregroundColor: Resouces.Colors.textFieldColorText])
        return textField
    }()
    
    let textFieldPhoneNumber: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.backgroundColor = Resouces.Colors.textFieldColorbg
        textField.attributedPlaceholder = NSAttributedString(string: "Phone number",
                                                             attributes: [.foregroundColor: Resouces.Colors.textFieldColorText])
        return textField
    }()
    
    let buttonSignIn: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resouces.Colors.btnColor
        button.setTitle("Sign in", for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    let lableSubText: UILabel = {
        let lable = UILabel()
        lable.text = "Alredy have an account?"
        lable.font = UIFont.systemFont(ofSize: 12)
        lable.textColor = Resouces.Colors.subText
        return lable
    }()
    
    let buttonLogIn: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(Resouces.Colors.btnColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    let buttonSignInWithGoogle: UIButton = {
        let button = UIButton()
        button.setImage(Resouces.Images.google, for: .normal)
        button.setTitle("  Sign in with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    let buttonSignInWithApple: UIButton = {
        let button = UIButton()
        button.setImage(Resouces.Images.apple, for: .normal)
        button.setTitle("  Sign in with Apple", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .white
        
        buttonLogIn.addTarget(self, action: #selector(openLogInVC), for: .touchUpInside)
        buttonSignIn.addTarget(self, action: #selector(createUserAccount), for: .touchUpInside)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action
    @objc private func openLogInVC(){
        coordinator?.openLoginPage()
    }
    
    @objc private func createUserAccount() {
        if textFieldName.text == "" {
            textFieldName.backgroundColor = .red.withAlphaComponent(0.4)
        } else if textFieldUsername.text == "" {
            textFieldName.backgroundColor = Resouces.Colors.textFieldColorbg
            textFieldUsername.backgroundColor = .red.withAlphaComponent(0.4)
        } else if textFieldPhoneNumber.text == "" {
            textFieldUsername.backgroundColor = Resouces.Colors.textFieldColorbg
            textFieldPhoneNumber.backgroundColor = .red.withAlphaComponent(0.4)
        } else {
            textFieldName.backgroundColor = Resouces.Colors.textFieldColorbg
            textFieldUsername.backgroundColor = Resouces.Colors.textFieldColorbg
            textFieldPhoneNumber.backgroundColor = Resouces.Colors.textFieldColorbg
            NetworkManager.shared.restredUser(name: textFieldName.text!,
                                              username: textFieldUsername.text!,
                                              phoneNumber: textFieldPhoneNumber.text!) { user in
                if (user.userID != 0) {
                    print(user.accessToken)
//                    let tabBar = TabBarController()
//                    tabBar.modalPresentationStyle = .fullScreen
//                    self.present(tabBar, animated: true)
                }
            }
        }
    }
    
   private func alertMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    //MARK: - Configure
    private func configure() {
        [textLable,
         textFieldName,
         textFieldUsername,
         textFieldPhoneNumber,
         buttonSignIn,
         lableSubText,
         buttonLogIn,
         buttonSignInWithGoogle,
         buttonSignInWithApple].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            textLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 156),
            textLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textFieldName.widthAnchor.constraint(equalToConstant: 290),
            textFieldName.heightAnchor.constraint(equalToConstant: 30),
            textFieldName.topAnchor.constraint(equalTo: textLable.bottomAnchor, constant: 77),
            textFieldName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textFieldUsername.widthAnchor.constraint(equalToConstant: 290),
            textFieldUsername.heightAnchor.constraint(equalToConstant: 30),
            textFieldUsername.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 35),
            textFieldUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textFieldPhoneNumber.widthAnchor.constraint(equalToConstant: 290),
            textFieldPhoneNumber.heightAnchor.constraint(equalToConstant: 30),
            textFieldPhoneNumber.topAnchor.constraint(equalTo: textFieldUsername.bottomAnchor, constant: 35),
            textFieldPhoneNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonSignIn.widthAnchor.constraint(equalToConstant: 290),
            buttonSignIn.heightAnchor.constraint(equalToConstant: 46),
            buttonSignIn.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 35),
            buttonSignIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lableSubText.topAnchor.constraint(equalTo: buttonSignIn.bottomAnchor, constant: 17),
            lableSubText.leadingAnchor.constraint(equalTo: buttonSignIn.leadingAnchor),
            
            buttonLogIn.widthAnchor.constraint(equalToConstant: 35),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 10),
            buttonLogIn.leadingAnchor.constraint(equalTo: lableSubText.trailingAnchor, constant: 5),
            buttonLogIn.topAnchor.constraint(equalTo: buttonSignIn.bottomAnchor, constant: 17),
            
            buttonSignInWithGoogle.widthAnchor.constraint(equalToConstant: 170),
            buttonSignInWithGoogle.heightAnchor.constraint(equalToConstant: 30),
            buttonSignInWithGoogle.topAnchor.constraint(equalTo: lableSubText.bottomAnchor, constant: 70),
            buttonSignInWithGoogle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonSignInWithApple.widthAnchor.constraint(equalToConstant: 170),
            buttonSignInWithApple.heightAnchor.constraint(equalToConstant: 30),
            buttonSignInWithApple.topAnchor.constraint(equalTo: buttonSignInWithGoogle.bottomAnchor, constant: 35),
            buttonSignInWithApple.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
