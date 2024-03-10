//
//  Item.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/02/26.
//

import Foundation

struct Item: Hashable {
    let sentence:  String
    let memo: String
}

struct MockData: Hashable {
    static let shared = MockData()
    var items = [
        Item(sentence: "Kanan: What do you mean, That's not good? What can we do?\nBendu: What do you want to do, him?\nEzra: I want to stop seeing Maul.\nEzra: Look, I can't make sense of what I saw.  I couldn't even describe it if I wanted to.\nMaul: And that is why you need to come with me.”", memo: "1"),
        Item(sentence: "國神", memo: "2"),
        Item(sentence: "千切", memo: "3"),
        Item(sentence: "凛", memo: "4"),
        Item(sentence: "馬狼", memo: "5"),
        Item(sentence: "蜂楽", memo: "6"),
        Item(sentence: "冴", memo: "7"),
        Item(sentence: "凪", memo: "8"),
        Item(sentence: "レオ", memo: "1"),
        Item(sentence: "斬鉄", memo: "2"),
        Item(sentence: "なるはや", memo: "3"),
        Item(sentence: "ががまる", memo: "4"),
        Item(sentence: "シャルル", memo: "5"),
        Item(sentence: "カイザー", memo: "6"),
        Item(sentence: "ノア", memo: "7"),
        Item(sentence: "クリス", memo: "8"),
    ]

}
