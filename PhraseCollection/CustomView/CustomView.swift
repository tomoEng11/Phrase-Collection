//
//  CustomView.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/03/13.
//

import UIKit

class CustomView: UIView {

    // グラデーションを描画するCALayer
    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // グラデーションの色
        let gradientColors: [UIColor] = [.yellow, .cyan]

        // グラデーションレイヤーの設定
        let gradientLayer = CAGradientLayer()
        gradientLayer.bounds.size = bounds.size
        gradientLayer.position = center
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.colors = gradientColors.map { $0.cgColor }

        // マスクレイヤーの設定
        let maskLayer = CAShapeLayer()

        // UIBezierPathで四角形を描く
        let rectPath = UIBezierPath(rect: bounds)

        // マスクに四角形を設定
        maskLayer.path = rectPath.cgPath

        // グラデーションレイヤーにマスクを設定
        gradientLayer.mask = maskLayer

        // グラデーションレイヤーを親のビューに追加
        layer.addSublayer(gradientLayer)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // グラデーションのレイヤーをtextViewのboundsに合わせて再配置
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
