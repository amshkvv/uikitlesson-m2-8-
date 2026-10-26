//
//  CollectionCell.swift
//  m2l8
//
//  Created by AndreyM on 26.10.2026.
//
import  UIKit


class  CollectionCell : UICollectionViewCell {
    
    static let CellId = "CollectionCell"
    
    var oBtn : (() -> Void)?
    
    lazy var imageView : UIImageView = {
        $0.frame = CGRect(x: 10, y: 10, width: bounds.width - 20, height: 100)
        $0.backgroundColor = .gray
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    
    lazy var avatarView : UIImageView = {
        $0.frame = CGRect(x: 10, y: imageView.frame.maxY + 10, width: 20 , height: 20)
        $0.backgroundColor = .gray
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var nameLabel : UILabel = {
        $0.frame = CGRect(x: avatarView.frame.maxX + 10, y: imageView.frame.maxY + 10, width: bounds.width - 20 , height: 20)
        $0.text = "Name"
        return $0
    }(UILabel())
    
    lazy var contentLabel : UILabel = {
        $0.frame = CGRect(x: 10, y: avatarView.frame.maxY + 10, width: bounds.width - 20, height: 45)
        $0.text = "Content"
        $0.numberOfLines = 2
        return $0
    }(UILabel())
    
    
    lazy var detailsBtn : UIButton = {
        $0.frame = CGRect(x: 10, y: bounds.maxY - 30, width: bounds.width - 20, height: 20)
        $0.backgroundColor = .systemGreen
        $0.setTitle("Подробнее", for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 5
        return $0
    }(UIButton(primaryAction: UIAction{ [weak self] _ in
        self?.oBtn?()
    }))

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 15
    }
    
    func setupCell(item : MockData){
        
        imageView.image = UIImage(named: item.imageContent)
        avatarView.image = UIImage(named: item.imageAvatar)
        nameLabel.text = item.userName
        contentLabel.text = item.content
        
        
        contentView.addSubview(imageView)
        contentView.addSubview(avatarView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(detailsBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
