//
//  MainChatViewController.swift
//  chatTesrApp
//
//  Created by admin1 on 24.03.23.
//

import UIKit

final class MainChatViewController: UIViewController {
    
    let lableMessageOne: UILabel = {
        let message = UILabel()
        message.font = .robotoRegular(size: 25)
        message.textColor = Resouces.Colors.text
        message.text = "Hi😁"
        return message
    }()
    
    let lableMessageTwo: UILabel = {
        let message = UILabel()
        message.font = .robotoRegular(size: 25)
        message.textColor = Resouces.Colors.text
        message.text = "Hi)"
        return message
    }()
    
    let lableMessageThree: UILabel = {
        let message = UILabel()
        message.font = .robotoRegular(size: 25)
        message.textColor = Resouces.Colors.text
        message.text = "How are you?"
        return message
    }()
    
    let lableMessageFour: UILabel = {
        let message = UILabel()
        message.font = .robotoRegular(size: 25)
        message.textColor = Resouces.Colors.text
        message.text = "Cool😽"
        return message
    }()
    
    let textFieldMessage: UITextField = {
       let textField = UITextField()
        textField.textAlignment = .left
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 0.2
        textField.backgroundColor = Resouces.Colors.textFieldColorbg
        textField.attributedPlaceholder = NSAttributedString(string: "message",
                                                             attributes: [.foregroundColor: Resouces.Colors.textFieldColorText])
        return textField
    }()
    
    let buttonPushMessage: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resouces.Colors.textFieldColorbg
        button.setImage(UIImage(systemName: "paperplane.circle.fill" ), for: .normal)
        button.tintColor = Resouces.Colors.btnColor
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.2
        button.setTitleColor(Resouces.Colors.btnColor, for: .normal)
        return button
    }()
        
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = Resouces.Colors.active
        title = ""
        self.tabBarController?.tabBar.isHidden = true
        
        configure()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWasShown(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
               object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self);
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
        UIView.animate(withDuration: 0.5, animations: { [self] () -> Void in
            NSLayoutConstraint.activate([
                textFieldMessage.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -340),
                buttonPushMessage.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -340)
            ])
        })
    }
    
    //MARK: - Configure
    private func configure() {
        [lableMessageOne,
         lableMessageTwo,
         lableMessageFour,
         lableMessageThree,
         buttonPushMessage, textFieldMessage
         ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            lableMessageOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 7),
            lableMessageOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            lableMessageTwo.topAnchor.constraint(equalTo: lableMessageOne.bottomAnchor, constant: 7),
            lableMessageTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),

            lableMessageThree.topAnchor.constraint(equalTo: lableMessageTwo.bottomAnchor, constant: 7),
            lableMessageThree.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),

            lableMessageFour.topAnchor.constraint(equalTo: lableMessageThree.bottomAnchor, constant: 7),
            lableMessageFour.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            textFieldMessage.heightAnchor.constraint(equalToConstant: 40),
            textFieldMessage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            textFieldMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            textFieldMessage.trailingAnchor.constraint(equalTo: buttonPushMessage.leadingAnchor),

            buttonPushMessage.heightAnchor.constraint(equalToConstant: 40),
            buttonPushMessage.widthAnchor.constraint(equalToConstant: 40),
            buttonPushMessage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            buttonPushMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}


