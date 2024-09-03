//
//  Item.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
