//
//  ViewController.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/02/27.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //collectionViewとdataSourceをプロパティにセット
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Int, Item>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
    }

    func configureCollectionView() {

        //flowLayoutの初期化
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.bounds.width - 24) / 3, height: (view.bounds.width - 24) / 3)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Item>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseIdentifier, for: indexPath) as? CustomCollectionViewCell else {
                return nil
            }

//            cell.configure(with: item)
            return cell
        }

        var snapshot = NSDiffableDataSourceSnapshot<Int, Item>()
        snapshot.appendSections([0])

        // Create 20 random systemName items
        for index in 1...20 {
            let randomSystemName = "star.circle.fill" // You can replace this with a random systemName generation logic
            let item = Item(text: "Item \(index)", systemName: randomSystemName)
            snapshot.appendItems([item], toSection: 0)
        }

        dataSource.apply(snapshot, animatingDifferences: true)
    }

    // MARK: - UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.numberOfSections(in: collectionView)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.collectionView(collectionView, numberOfItemsInSection: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return dataSource.collectionView(collectionView, cellForItemAt: indexPath)
    }
}

//#Preview {
//    let vc = ViewController()
//    return vc
//}
