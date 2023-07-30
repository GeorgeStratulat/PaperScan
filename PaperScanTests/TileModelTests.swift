//
//  TileModelTests.swift
//  PaperScanTests
//
//  Created by George Stratulat on 30.07.2023.
//

import XCTest

final class TileModelTests: XCTestCase {
    var sut = Tile(id: 1)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddChildren() {
        let tile = Tile(id: 2)
        
        sut.addChildren(children: [tile])
        
        XCTAssertEqual(sut.children, [tile])
    }
    
    func testAddChildrenWithChildren() {
        let tile = Tile(id: 2, children: [Tile(id: 3), Tile(id: 4)])
        
        sut.addChildren(children: [tile])
        
        XCTAssertEqual(sut.children.count, 3)
    }
}
