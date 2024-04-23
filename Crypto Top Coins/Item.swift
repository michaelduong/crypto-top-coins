//
//  Item.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
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
