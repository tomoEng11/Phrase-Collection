//
//  CardViewController.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/02/25.
//

import UIKit

class CardViewController: UIViewController {

    private let tagLabel = CustomTagLabel(backgroundColor: .systemOrange, fontSize: 12)
    private let sentenceTextView = UITextView()
    private let memoTextView = UITextView()
    private let stackView = UIStackView()
    private let cardView = UIView()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTapGesture()
        configureTagLabel()
        configureSentenceTextView()
        configureMemoTextView()
        configureStackView()
        configureCardView()
        configureButton()
    }

    private func configureCardView() {
        view.addSubview(cardView)
        cardView.backgroundColor = .systemBackground
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardView.layer.borderWidth = 2
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 24
        cardView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,  constant: 16),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            cardView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }

    private func configureStackView() {
        cardView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 20

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
        ])
    }

    private func configureTagLabel() {
        cardView.addSubview(tagLabel)
        tagLabel.text = "Followers21-21"


        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 32),
            tagLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            tagLabel.heightAnchor.constraint(equalToConstant: 24),
            tagLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func configureSentenceTextView() {
        stackView.addArrangedSubview(sentenceTextView)
        sentenceTextView.delegate = self
        sentenceTextView.font = UIFont.systemFont(ofSize: 20)
        sentenceTextView.textColor = .white
        sentenceTextView.layer.cornerRadius = 10
        sentenceTextView.textAlignment = .left
        sentenceTextView.translatesAutoresizingMaskIntoConstraints = false
        sentenceTextView.backgroundColor = .secondarySystemBackground

        NSLayoutConstraint.activate([
            sentenceTextView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            sentenceTextView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            sentenceTextView.heightAnchor.constraint(equalToConstant: 260)
        ])
    }

    func configureMemoTextView() {
        stackView.addArrangedSubview(memoTextView)
        memoTextView.delegate = self
        memoTextView.font = UIFont.systemFont(ofSize: 20)
        memoTextView.textColor = .white
        memoTextView.layer.cornerRadius = 10
        memoTextView.textAlignment = .left
        memoTextView.translatesAutoresizingMaskIntoConstraints = false
        memoTextView.backgroundColor = .secondarySystemBackground

        NSLayoutConstraint.activate([
            memoTextView.topAnchor.constraint(equalTo: sentenceTextView.bottomAnchor, constant: 24),
            memoTextView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            memoTextView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            memoTextView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24)
        ])
    }

    func configureButton() {
        cardView.addSubview(button)
        button.backgroundColor = .secondarySystemBackground
        button.layer.borderColor = UIColor.tintColor.cgColor
        button.layer.borderWidth = 2
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50),
            button.centerYAnchor.constraint(equalTo: tagLabel.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }


    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        navigationItem.rightBarButtonItem = doneButton
    }

    func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(with:)))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard(with gesture: UITapGestureRecognizer) {
        print("Tap detected!")
        sentenceTextView.resignFirstResponder()
        memoTextView.resignFirstResponder()
    }
}

extension CardViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {

    }
}

#Preview {
    let vc = CardViewController()
    return vc
}
