//
//  CardCollectionVC.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/02/26.
//

import UIKit
import RealmSwift

class CardCollectionVC: UIViewController {

    enum Section {
        case main
    }

    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, RealmData>!
    var isSearching: Bool = false
    let realm = try! Realm()

    override func viewDidLoad() {
        let items = realm.objects(RealmData.self)
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        updateData(on: items)
        configureSearchController()
        configureViewController()
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in

                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseID, for: indexPath) as! CardCollectionViewCell

                DispatchQueue.main.async {
                    cell.set(with: item)
                }
                return cell
            }
        )
    }

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reuseID)
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = false
    }

    private func createTwoColumnFlowLayout() -> UICollectionViewFlowLayout {

        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 2

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)

        return flowLayout
    }

    private func updateData(on items: Results<RealmData>) {

        var snapshot = NSDiffableDataSourceSnapshot<Section, RealmData>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(items))
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func configureViewController() {
        view.backgroundColor = .systemBackground
        self.title = "Phrase Collection"
        let selectButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(selectButtonPressed))
        navigationItem.rightBarButtonItem = selectButton
    }

    @objc private func selectButtonPressed() {

        collectionView.allowsMultipleSelection.toggle()
        
        if collectionView.allowsMultipleSelection {
                let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(selectButtonPressed))
                navigationItem.rightBarButtonItem = cancelButton
            } else {
                let selectButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(selectButtonPressed))
                navigationItem.rightBarButtonItem = selectButton
            }
    }

    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for your favorite phrase!"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        let items = realm.objects(RealmData.self)
        updateData(on: items)

    }
}

extension CardCollectionVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true

        let filteredItem = realm.objects(RealmData.self).filter("sentence contains '\(filter.lowercased())' OR sentence contains '\(filter.uppercased())'")

        updateData(on: filteredItem)
    }
}

extension CardCollectionVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.allowsMultipleSelection {
            print("選択ボタンが押された状態です")
            let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
            // チェックマークを非表示
            cell.reverseIsSelected()


        } else {
            if let selectedItem = dataSource.itemIdentifier(for: indexPath) {

                let destinationVC = CardDetailVC()
                destinationVC.sentenceTextView.text = selectedItem.sentence
                destinationVC.memoTextView.text = selectedItem.memo
                navigationController?.pushViewController(destinationVC, animated: true)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        // セルを取得
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        // チェックマークを非表示
        cell.reverseIsSelected()
    }
}

#Preview {
    let vc = CardCollectionVC()
    return vc
}
