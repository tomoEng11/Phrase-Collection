//
//  CollectionViewCell.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/02/26.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    private let sentenceLabel = UILabel()
    private let tagLabel = CustomTagLabel(backgroundColor: .systemOrange, fontSize: 12)
    static let reuseID = "Cell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTagLabel()
        configureSentenceLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureTagLabel() {
        contentView.addSubview(tagLabel)

        tagLabel.text = "Follwers32-32"

        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: topAnchor),
            tagLabel.bottomAnchor.constraint(equalTo: sentenceLabel.topAnchor),
            tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func configureSentenceLabel() {
        contentView.addSubview(sentenceLabel)

        sentenceLabel.layer.masksToBounds = true
        sentenceLabel.layer.cornerRadius = 10
        sentenceLabel.backgroundColor = .systemBlue
        sentenceLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            sentenceLabel.topAnchor.constraint(equalTo: topAnchor),
            sentenceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            sentenceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sentenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
//
//    func set(with item: Item ) {
//        sentenceLabel.text = item.sentence
//    }

