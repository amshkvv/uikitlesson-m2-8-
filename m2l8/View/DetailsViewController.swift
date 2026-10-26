//
//  DetailsViewController.swift
//  m2l8
//
//  Created by AndreyM on 26.10.2026.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var item : MockData
    
    init(item: MockData) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var imageView : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        return $0
    }(UIImageView())
    
    lazy var avatatView : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
        return $0
    }(UIImageView())
    
    lazy var nameLabel : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Name"
        $0.textColor = .black
        return $0
    }(UILabel())
    
    lazy var contentLabel : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Content"
        $0.textColor = .black
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imageView.image = UIImage(named: item.imageContent)
        avatatView.image = UIImage(named: item.imageAvatar)
        nameLabel.text = item.userName
        contentLabel.text = item.content
        
        view.addSubview(imageView)
        view.addSubview(avatatView)
        view.addSubview(nameLabel)
        view.addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            avatatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            avatatView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            avatatView.heightAnchor.constraint(equalToConstant: 50),
            avatatView.widthAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatatView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 35),
            
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentLabel.topAnchor.constraint(equalTo: avatatView.bottomAnchor, constant: 20),
            
        ])
    }
}
