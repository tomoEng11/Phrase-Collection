//
//  UIHelper.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/02/26.
//

import UIKit

struct UIHelper {

    static func createTwoColumnFlowLayout(in superView: UIView) -> UICollectionViewFlowLayout {
        let width = superView.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)

        let itemWidth = availableWidth / 2

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)

        return flowLayout
    }
}
