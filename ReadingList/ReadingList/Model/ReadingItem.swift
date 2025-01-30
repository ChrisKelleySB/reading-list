//
//  ReadingItem.swift
//  ReadingList
//
//  Created by Christopher Kelley on 1/29/25.
//

import Foundation
import Observation

@Observable
class ReadingItem: Identifiable, Hashable, Equatable, Codable {
    let title: String
    let url: URL?
    let creationDate: Date
    let hasFinishedReading: Bool
    let id: UUID
    
    init(title: String,
         url: URL? = nil,
         creationDate: Date = Date(),
         hasFinishedReading: Bool = false,
         id: UUID = UUID()) {
        self.title = title
        self.url = url
        self.creationDate = creationDate
        self.hasFinishedReading = hasFinishedReading
        self.id = id
    }
    
    static func == (lhs: ReadingItem, rhs: ReadingItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static var example: ReadingItem {
        .init(title: "Example Reading Item", url: URL(string: "https://apple.com")!)
    }
    
    static var examples: [ReadingItem] {
        [.example,
        ReadingItem(title: "Example Reading Item", url: URL(string: "https://apple.com")!),
        ReadingItem(title: "Second Example Item", url: URL(string: "https://google.com")!)
        ]
    }
}
