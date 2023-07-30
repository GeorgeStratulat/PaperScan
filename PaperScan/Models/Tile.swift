//
//  Tile.swift
//  PaperScan
//
//  Created by George Stratulat on 29.07.2023.
//

import Foundation

struct Tile: Identifiable, Equatable {
    let id: Int
    
    var children = [Tile]()
    
    mutating func addChildren(children: [Tile]) {
        for child in children {
            self.children.append(child)
            if child.children.count > 0 {
                self.children.append(contentsOf: child.children)
            }
        }
    }
}
