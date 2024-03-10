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

    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    var itemArray:[Item] = MockData.shared.items
    var filteredItemArray: [Item] = []
    var isSearching: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        updateData(on: itemArray)
        configureSearchController()
        view.backgroundColor = .systemBackground
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseID, for: indexPath) as! CardCollectionViewCell

            DispatchQueue.main.async {
                cell.set(with: item)
            }
            return cell
        })
    }

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reuseID)
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

    private func updateData(on items: [Item]) {

        let activeArray = isSearching ? filteredItemArray : itemArray

        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(activeArray)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension CardCollectionViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true

//contains()内のfilterは検索wordのこと
        filteredItemArray = MockData.shared.items.filter {
        $0.sentence.lowercased().contains(filter.lowercased())}
        print(filteredItemArray)
        updateData(on: filteredItemArray)

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
        updateData(on: itemArray)
    }
}

#Preview {
    let vc = CardCollectionViewController()
    return vc
}
