//
//  TileView.swift
//  PaperScan
//
//  Created by George Stratulat on 30.07.2023.
//

import SwiftUI

struct DocumentView: View {
    @Namespace var namespace
    
    let tile: Tile
    let selected: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ForEach(tile.children, id: \.id) { child in
                DocumentView(tile: child, selected: false)
                    .rotationEffect(.degrees(-5))
            }
            ZStack {
                if tile.children.count > 0 {
                    VStack {
                        Spacer()
                        Text("\(tile.children.count + 1)")
                            .padding(2.5)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                    }
                    .padding(.bottom, 5)
                    
                }
                Text("\(tile.id)")
                    .font(.system(size: 30))
                    .bold()
            }
                .frame(width: 100, height: 150)
                .background(Color.white)
                .shadow(radius: 2.5)
            if tile.children.count > 1 {
                Image(systemName: "paperclip")
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(.blue, lineWidth: selected ? 5: 0))
        .matchedGeometryEffect(id: tile.id, in: namespace)
    }
}

struct DocumentView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentView(tile: Tile(id: 1), selected: false)
    }
}
