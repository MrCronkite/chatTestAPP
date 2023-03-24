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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .white
        title = "Profile"
        
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    private func configureAppearance() {
        [imageAvatarView,
         lablePhoneNumber,
         lableUsername,
         lableName
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
            lableName.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
