//
//  LazyVGridView.swift
//  LazyLab
//
//  Created by Zeeshan Waheed on 31/03/2026.
//

import Foundation
import SwiftUI

struct LazyVGridView: View {
    
    @State private var showLargeData = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var data: [Int] {
        showLargeData ? Array(0..<1000) : Array(0..<20)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                Toggle("Show 1000 items", isOn: $showLargeData)
                    .padding()
                
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(data, id: \.self) { item in
                        Text("\(item)")
                            .frame(height: 100)
                            .frame(maxWidth: .infinity)
                            .background(Color.orange.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("LazyVGrid")
    }
}
