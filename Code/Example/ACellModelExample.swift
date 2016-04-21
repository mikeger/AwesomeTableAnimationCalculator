//
// Created by Alexander Babaev on 17.04.16.
// Copyright (c) 2016 Alexander Babaev, LonelyBytes. All rights reserved.
// Sources: https://github.com/bealex/AwesomeTableAnimationCalculator
// License: MIT
//

import Foundation

class ACellModelExample: ACellModel {
    var id:String
    var text:String
    var header:String

    init(text:String, header:String) {
        id = NSUUID().UUIDString
        self.text = text
        self.header = header
    }

    required init(copy: ACellModelExample) {
        id = copy.id
        text = copy.text
        header = copy.header
    }

    func contentIsSameAsIn(another: ACellModelExample) -> Bool {
        return text == another.text
    }

    func isInSameSectionWith(another: ACellModelExample) -> Bool {
        return header == another.header
    }

    func createSection() -> ASectionModelExample {
        return ASectionModelExample(title:header)
    }
}

extension ACellModelExample: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Header: \"\(header)\"; Text: \"\(text)\"; id: \(id)"
    }
}

func ==(lhs: ACellModelExample, rhs: ACellModelExample) -> Bool {
    return lhs.id == rhs.id
}
