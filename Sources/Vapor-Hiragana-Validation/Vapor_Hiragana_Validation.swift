import Foundation
import Vapor

extension String {
    var isHiragana: Bool {
        let range = "^[ぁ-ゞ 　]+$"
        return NSPredicate(format: "SELF MATCHES %@", range).evaluate(with: self)
    }
}

extension Validator where T == String {
    public static var hiragana: Validator<T> {
        .init {
            ValidatorResults.Hiragana(isHiragana: $0.isHiragana)
        }
    }
}

extension ValidatorResults {
    public struct Hiragana {
        public let isHiragana: Bool
    }
}

extension ValidatorResults.Hiragana: ValidatorResult {
    public var isFailure: Bool {
        !self.isHiragana
    }
    
    public var successDescription: String? {
        "is hiragana"
    }
    
    public var failureDescription: String? {
        "is not hiragana"
    }
}
