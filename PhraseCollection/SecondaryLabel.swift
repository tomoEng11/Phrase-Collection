//
//  TagLabel.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/02/25.
//

import UIKit

class SecondaryLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(textAlignment: NSTextAlignment, textColor: UIColor) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.textColor = textColor
        configure()
    }

    private func configure() {
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview {
    let view = SecondaryLabel(textAlignment: .left, textColor: .white)
    view.text = "スピードもパワーもテクニックもない俺が\nブルーロックにいられるのは...\n俺のゴールの最後のピースは、俺のいる未来に誰にも追いつく時間を与えないダイレクトシュートだ！！！"
    view.numberOfLines = 2
    return view
}
