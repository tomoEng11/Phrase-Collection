//
//  Data.swift
//  PhraseCollection
//
//  Created by 井本智博 on 2024/02/26.
//

import Foundation
import RealmSwift

class DataModel: Object {
    @objc dynamic var sentence: String = ""
    @objc dynamic var memo: String = ""
    @objc dynamic var tag: String = ""
    @objc dynamic var isChecked = false
}
