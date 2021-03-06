//
// Created by Alexander Babaev on 17.04.16.
// Copyright (c) 2016 Alexander Babaev, LonelyBytes. All rights reserved.
// Sources: https://github.com/bealex/AwesomeTableAnimationCalculator
// License: MIT https://github.com/bealex/AwesomeTableAnimationCalculator/blob/master/LICENSE
//

import Foundation
import AwesomeTableAnimationCalculator

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

    func shortDescription() -> String {
        return "\(header)/\(text)"
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

@objc
class ACellModelExampleObjC: NSObject, ACellModel {
    var id:String
    var text:String
    var header:String

    init(text:String, header:String) {
        id = NSUUID().UUIDString
        self.text = text
        self.header = header
    }

    required init(copy: ACellModelExampleObjC) {
        id = copy.id
        text = copy.text
        header = copy.header
    }

    func contentIsSameAsIn(another: ACellModelExampleObjC) -> Bool {
        return text == another.text
    }

    override var debugDescription: String {
        return "Header: \"\(header)\"; Text: \"\(text)\"; id: \(id)"
    }

    func shortDescription() -> String {
        return "\(header)/\(text)"
    }
}

func ==(lhs: ACellModelExampleObjC, rhs: ACellModelExampleObjC) -> Bool {
    return lhs.id == rhs.id
}
