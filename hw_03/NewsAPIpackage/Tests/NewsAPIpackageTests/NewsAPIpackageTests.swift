import XCTest
@testable import NewsAPIpackage

final class NewsAPIpackageTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NewsAPIpackage().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
