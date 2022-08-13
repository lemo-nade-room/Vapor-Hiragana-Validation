import XCTest
@testable import Vapor_Hiragana_Validation

final class Vapor_Hiragana_ValidationTests: XCTestCase {
    func testHiragana() {
        XCTAssertTrue("ひらがな".isHiragana)
    }
    
    func testAlphabet() {
        XCTAssertFalse("Englishです".isHiragana)
    }
    
    func testKanji() {
        XCTAssertFalse("漢字です".isHiragana)
    }
    
    func testKatakana() {
        XCTAssertFalse("カタカナです".isHiragana)
    }
}
