//
//  LazyHGridView.swift
//  LazyLab
//
//  Created by Zeeshan Waheed on 31/03/2026.
//

import Foundation
import SwiftUI

struct LazyHGridView: View {
    
    @State private var showLargeData = false
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var data: [Int] {
        showLargeData ? Array(0..<1000) : Array(0..<20)
    }
    
    var body: some View {
        VStack {
            
            Toggle("Show 1000 items", isOn: $showLargeData)
                .padding()
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 12) {
                    ForEach(data, id: \.self) { item in
                        Text("\(item)")
                            .frame(width: 100, height: 100)
                            .background(Color.purple.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("LazyHGrid")
    }
}
