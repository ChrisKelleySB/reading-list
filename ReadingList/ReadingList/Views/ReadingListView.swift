//
//  ReadingListView.swift
//  ReadingList
//
//  Created by Christopher Kelley on 1/29/25.
//

import SwiftUI

struct ReadingListView: View {
    @Bindable var readingViewModel: ReadingDataViewModel //Bindable is a keyword with origin Observable
    @Binding var selectedItem: ReadingItem?
    @State private var newReadingEditorIsShown: Bool = false
    
    var body: some View {
        List(readingViewModel.readingList, selection: $selectedItem) { item in
            ReadingItemRow(item: item)
                .tag(item)
        }
        .toolbar {
            Button {
                newReadingEditorIsShown.toggle()
            } label: {
                Label("Add New Reading Item", systemImage: "plus")
            }

        }
        .sheet(isPresented: $newReadingEditorIsShown) {
            ReadingDataEditorView(readingViewModel: readingViewModel)
        }
    }
}

fileprivate struct ReadingItemRow: View {
    var item: ReadingItem
    
    var body: some View {
        HStack(alignment: . firstTextBaseline) {
            Image(systemName: item.hasFinishedReading ? "book.fill" : "book")
                .foregroundStyle(.green)
            VStack(alignment: .leading) {
                Text(item.title)
                Text(item.creationDate.formatted(.dateTime))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    @State @Previewable var selectedItem: ReadingItem?
    
    NavigationStack {
        ReadingListView(readingViewModel: ReadingDataViewModel(), selectedItem: $selectedItem)
    }
}
