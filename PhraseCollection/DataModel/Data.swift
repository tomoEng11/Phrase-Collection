//
//  Data.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/03/09.
//

import Foundation
import RealmSwift

class RealmData: Object {
    @objc dynamic var sentence: String = ""
    @objc dynamic var memo: String = ""
    @objc dynamic var tag: String = ""
}
