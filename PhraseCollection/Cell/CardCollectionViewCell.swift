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

    func set(with item: Item) {
        self.sentenceLabel.text = item.sentence
        self.backgroundColor = .systemBackground
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
    }

    private func configureTagLabel() {
        contentView.addSubview(tagLabel)

        tagLabel.text = "Follwers32-32"

        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tagLabel.heightAnchor.constraint(equalToConstant: 30),
            tagLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func configureSentenceLabel() {
        contentView.addSubview(sentenceLabel)

        sentenceLabel.clipsToBounds = true
        sentenceLabel.layer.cornerRadius = 10
        sentenceLabel.numberOfLines = 10
        sentenceLabel.textAlignment = .left
        sentenceLabel.font = .systemFont(ofSize: 12, weight: .regular)
        sentenceLabel.backgroundColor = .secondarySystemBackground
        sentenceLabel.translatesAutoresizingMaskIntoConstraints = false
        sentenceLabel.lineBreakMode = .byTruncatingTail

        NSLayoutConstraint.activate([
            sentenceLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 8),
            sentenceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            sentenceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            sentenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
}

