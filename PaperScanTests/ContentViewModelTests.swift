//
//  ContentViewModelTests.swift
//  ContentViewModelTests
//
//  Created by George Stratulat on 29.07.2023.
//

import XCTest
@testable import PaperScan

final class ContentViewModelTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    let sut = ContentViewModel()
    
    func testInit() {
        XCTAssertEqual(sut.selectedTiles.count, 0)
        XCTAssertEqual(sut.tiles.count, 10)
        //        XCTAssertEqual(sut.lastIndex, 10)
    }
    
    func testMergeTiles() async throws {
        sut.selectedTiles = [Tile(id: 1), Tile(id: 2), Tile(id: 3)]
        
        sut.mergeTiles()
        XCTAssertEqual(sut.tiles.first?.children.count, 2)
        
        let expectation = expectation(description: "Main Thread")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
            //            XCTAssertEqual(self?.sut.lastIndex, 12)
            XCTAssertEqual(self?.sut.selectedTiles.count, 0)
            expectation.fulfill()
        })
        await fulfillment(of: [expectation])
    }
    
}
