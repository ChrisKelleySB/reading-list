//
//  ReadingDetailView.swift
//  ReadingList
//
//  Created by Christopher Kelley on 1/29/25.
//

import SwiftUI

struct ReadingDetailView: View {
    let readingItem: ReadingItem
    
    var body: some View {
        Text(readingItem.url?.absoluteString ?? "No UrL found")
    }
}

#Preview {
    ReadingDetailView(readingItem: .example)
}
