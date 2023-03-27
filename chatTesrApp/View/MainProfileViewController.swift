//
//  MainProfileViewController.swift
//  chatTesrApp
//
//  Created by admin1 on 24.03.23.
//

import UIKit

final class MainProfileViewController: UIViewController{
    
    let imageAvatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = Resouces.Colors.active.cgColor
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "avatar")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let lablePhoneNumber: UILabel = {
        let text = UILabel()
        text.textColor = Resouces.Colors.subText
        text.text = "+3752999999"
        text.font = .robotoRegular(size: 12)
        return text
    }()
    
    let lableUsername: UILabel = {
        let text = UILabel()
        text.textColor = Resouces.Colors.subText
        text.text = "Username"
        text.font = .robotoRegular(size: 14)
        return text
    }()
    
    let lableName: UILabel = {
        let text = UILabel()
        text.textColor = Resouces.Colors.text
        text.text = "Welcome Name"
        text.font = .robotoRegular(size: 30)
        return text
    }()
    
    let lableCityName: UILabel = {
        let text = UILabel()
        text.textColor = Resouces.Colors.text
        text.text = "NewYork"
        text.font = .robotoRegular(size: 20)
        return text
    }()
    
    let lableDateOfBirth: UILabel = {
        let text = UILabel()
        text.textColor = Resouces.Colors.text
        text.text = "1999.02.03"
        text.font = .robotoRegular(size: 16)
        return text
    }()
    
    let buttonChangeData: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resouces.Colors.btnColor
        button.setTitle("Edit profile", for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .white
        title = "Profile"
        
        buttonChangeData.addTarget(self, action: #selector(getData), for: .touchUpInside)
        
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func getData() {
        NetworkManager().getUserData { user in
            print("wot \(user)")
        }
    }
    //MARK: - Configure
    private func configureAppearance() {
        [imageAvatarView,
         lablePhoneNumber,
         lableUsername,
         lableName, lableCityName, lableDateOfBirth, buttonChangeData
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageAvatarView.heightAnchor.constraint(equalToConstant: 100),
            imageAvatarView.widthAnchor.constraint(equalToConstant: 100),
            imageAvatarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            imageAvatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lablePhoneNumber.topAnchor.constraint(equalTo: imageAvatarView.bottomAnchor, constant: 5),
            lablePhoneNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lableUsername.topAnchor.constraint(equalTo: lablePhoneNumber.bottomAnchor, constant: 2),
            lableUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lableName.topAnchor.constraint(equalTo: lableUsername.bottomAnchor, constant: 10),
            lableName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lableCityName.topAnchor.constraint(equalTo: lableName.bottomAnchor, constant: 20),
            lableCityName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            lableDateOfBirth.topAnchor.constraint(equalTo: lableCityName.bottomAnchor, constant: 5),
            lableDateOfBirth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            buttonChangeData.widthAnchor.constraint(equalToConstant: 290),
            buttonChangeData.heightAnchor.constraint(equalToConstant: 46),
            buttonChangeData.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonChangeData.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
