//
//  LazyVStackView.swift
//  LazyLab
//
//  Created by Zeeshan Waheed on 31/03/2026.
//

import Foundation
import SwiftUI

struct LazyVStackView: View {
    
    @State private var showLargeData = false
    
    var data: [Int] {
        showLargeData ? Array(0..<1000) : Array(0..<20)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                Toggle("Show 1000 items", isOn: $showLargeData)
                    .padding()
                
                LazyVStack(spacing: 12) {
                    ForEach(data, id: \.self) { item in
                        Text("Row \(item)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("LazyVStack")
    }
}
