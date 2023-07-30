//
//  ContentViewModel.swift
//  PaperScan
//
//  Created by George Stratulat on 30.07.2023.
//

import Foundation

final class ContentViewModel: ObservableObject {
    @Published var lastIndex = 10
    
    @Published  var tiles = {
        var tiles = [Tile]()
        for i in 1...10 {
            tiles.append(Tile(id: i))
        }
        return tiles
    }()
    
    @Published var selectedTiles = [Tile]()
    
    // method used for filling the tiles; we need to always have 10 tiles
    func addTiles(_ upTo: Int = 10) {
        let toBeAdded = upTo - self.tiles.count
        
        for i in (lastIndex + 1)...(toBeAdded + lastIndex) {
            tiles.append(Tile(id: i))
        }
        lastIndex += toBeAdded
    }
    
    // method used for merging the tiles
    func mergeTiles() {
        var firstTile = selectedTiles[0]
        var auxTiles = selectedTiles
        
        auxTiles.remove(at: 0)
        firstTile.addChildren(children: auxTiles) // we add all the selected tiles except for itself
        
        var copy = self.tiles
        copy = copy.map {
            var tile = $0
            // we merge into the first selected tile
            if tile.id == firstTile.id {
                tile.addChildren(children: auxTiles)
            }
            return tile
        }
        
        // concurrently we update the UI
        DispatchQueue.main.async { [weak self] in
            self?.tiles = copy.filter { !auxTiles.contains($0) }
            self?.addTiles()
            self?.selectedTiles = []
        }
    }
}
