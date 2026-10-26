//
//  ViewController.swift
//  m2l8
//
//  Created by AndreyM on 25.10.2026.
//

import UIKit

class ViewController: UIViewController {
    
    private let items = MockData.getData()

    private lazy var layout : UICollectionViewFlowLayout = {
        $0.itemSize = CGSize(width : (view.frame.width - 60) / 2, height : 240)
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 10
        $0.minimumInteritemSpacing = 17
        $0.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView : UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.CellId)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        view.addSubview(collectionView)
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
         
    }
}


extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.CellId, for: indexPath) as! CollectionCell
        cell.setupCell(item: items[indexPath.item])
        
        cell.oBtn = { [weak self] in
            guard let self = self else { return }
            
            let details = DetailsViewController(item: self.items[indexPath.item])
            self.navigationController?.pushViewController(details, animated: true)
        }
        
        return cell
    }
    
    
}

//extension ViewController : UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        
//        let item = items[indexPath.item]
//        
//        let details = DetailsViewController(item: items[indexPath.item])
//        details.item = item
//        navigationController?.pushViewController(details, animated: true)
//    }
//}

