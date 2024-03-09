//
//  CollectionViewController.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/02/26.
//

import UIKit

class CardCollectionViewController: UIViewController {

    enum Section {
        case main
    }

//    var items: [Item] = []
    var collectionView: UICollectionView!
//    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        collectionView.delegate = self
//        collectionView.backgroundColor = .systemBackground
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reuseID)
        view.addSubview(collectionView)
    }
}

extension CardCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseID, for: indexPath) as! CardCollectionViewCell
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
}

#Preview {
    let vc = CardCollectionViewController()
    return vc
}

