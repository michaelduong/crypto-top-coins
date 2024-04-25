//
//  StatView.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import SwiftUI

struct StatView: View {
    let stat: StatModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(stat.title)
                .foregroundStyle(.secondary)
                .font(.caption)
            
            Text(stat.value)
                .font(.headline)
                .bold()
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle((stat.percentageChange ?? 0 ) >= 0 ? .green : .red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}
