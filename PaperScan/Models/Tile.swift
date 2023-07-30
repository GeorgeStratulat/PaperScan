//
//  Tile.swift
//  PaperScan
//
//  Created by George Stratulat on 29.07.2023.
//

import Foundation

struct Tile: Identifiable, Equatable {
    let id: Int
    
    let name = UUID().uuidString
    
    var children = [Tile]()
    
    mutating func addChildren(children: [Tile]) {
        self.children.append(contentsOf: children)
    }
}
