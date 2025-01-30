//
//  ReadingDataEditorView.swift
//  ReadingList
//
//  Created by Christopher Kelley on 1/29/25.
//

import SwiftUI

struct ReadingDataEditorView: View {
    @Bindable var readingViewModel: ReadingDataViewModel
    @State var newURLString = ""
    @State var title = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create New Reading Item")
                .font(.title)
            TextField("URL", text: $newURLString)
            TextField("Title", text: $title)
            
            HStack {
                Spacer()
                Button("Cancel") {
                    dismiss()
                }
                .buttonStyle(.bordered)
                
                Button("Save") {
                    readingViewModel.addNewReadingItem(title: title, urlString: newURLString)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

#Preview {
    ReadingDataEditorView(readingViewModel: ReadingDataViewModel())
}
