//
//  SampleCell.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/02/27.
//

import UIKit

struct Item: Hashable {
    let text: String
    let systemName: String
}

class CustomCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "CustomCollectionViewCell"

    private let tagLabel: CustomTagLabel = {
        let tagLabel = CustomTagLabel(backgroundColor: .systemOrange, fontSize: 15)
        return tagLabel
    }()

    private 

    override init(frame: CGRect) {
        super.init(frame: frame)
//        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    private func configureSubviews() {
//        addSubview(imageView)
//        addSubview(label)
//
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
//
//            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
//            label.leadingAnchor.constraint(equalTo: leadingAnchor),
//            label.trailingAnchor.constraint(equalTo: trailingAnchor),
//        ])
//    }

//    func configure(with item: Item) {
//        label.text = item.text
//        imageView.image = UIImage(systemName: item.systemName)
//    }
}
