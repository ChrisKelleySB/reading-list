//
//  ContentView.swift
//  ReadingList
//
//  Created by Christopher Kelley on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @State private var readingViewModel = ReadingDataViewModel()
    @State private var selectedItem: ReadingItem? = nil
    
    var body: some View {
        NavigationSplitView {
            ReadingListView(readingViewModel: readingViewModel, selectedItem: $selectedItem)
        } detail: {
            if let selectedItem {
                ReadingDetailView(readingItem: selectedItem)
                Text(selectedItem.title)
            } else {
                ContentUnavailableView("Select a reading item", systemImage: "book")
            }
        }

        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
