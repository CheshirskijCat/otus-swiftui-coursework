import XCTest
@testable import GithubAPIpackage

final class GithubAPIpackageTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GithubAPIpackage().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
