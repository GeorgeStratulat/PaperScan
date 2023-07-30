//
//  ContentView.swift
//  PaperScan
//
//  Created by George Stratulat on 29.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    private var columnsGrid = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]

    var body: some View {
        VStack {
            let disabled = viewModel.selectedTiles.count < 2
            HStack {
                Spacer()
                Button("Merge") {
                    if viewModel.selectedTiles.count > 1 {
                        viewModel.mergeTiles()
                    }
                }
                .disabled(disabled)
                .foregroundColor(disabled ? .gray: .blue)
                .padding(.trailing, 10)
            }
            ScrollView {
                LazyVGrid(columns: columnsGrid, spacing: 0) {
                    ForEach(viewModel.tiles, id: \.id) { tile in
                        let selected = viewModel.selectedTiles.contains(tile)
                        DocumentView(tile: tile, selected: selected)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .border(.black, width: 0.5)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if selected {
                                    viewModel.selectedTiles = viewModel.selectedTiles.filter { $0 != tile }
                                } else {
                                    viewModel.selectedTiles.append(tile)
                                }
                            }
                            .animation(.spring(), value: viewModel.tiles)
                    }
                }
            }
            .background(Color.gray)
            .clipped()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
