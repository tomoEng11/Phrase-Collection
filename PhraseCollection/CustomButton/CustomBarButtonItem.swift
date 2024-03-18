//
//  CustomBarButtonItem.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/03/18.
//

import UIKit

class CustomTabBarButton: UIControl {
    // タイトルラベル
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    // イメージビュー
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // イニシャライザ
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // UIの設定
    private func configureUI() {
        // 画像の下にタイトルを表示するためのスタックビュー
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4

        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    // タイトルを設定するメソッド
    func setTitle(_ title: String?) {
        titleLabel.text = title
    }

    // イメージを設定するメソッド
    func setImage(_ image: UIImage?) {
        imageView.image = image
    }
}

