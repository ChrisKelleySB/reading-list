//
//  ReadingDataViewModel.swift
//  ReadingList
//
//  Created by Christopher Kelley on 1/30/25.
//

import Foundation
import Observation

@Observable
class ReadingDataViewModel {
    var readingList: [ReadingItem] = ReadingItem.examples
    
    func addNewReadingItem(title: String, urlString: String) {
        guard let newURL = URL(string: urlString) else { return }
        //TODO: Add Error Handling
        
        let newReadingItem = ReadingItem(title: title, url: newURL)
        readingList.append(newReadingItem)
    }
}
