//
//  StatModel.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/24/24.
//

import Foundation

struct StatModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
}
