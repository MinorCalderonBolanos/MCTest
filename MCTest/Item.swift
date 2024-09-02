//
//  Item.swift
//  MCTest
//
//  Created by Jorge Calderon on 2/9/24.
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
