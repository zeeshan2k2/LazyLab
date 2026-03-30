//
//  LazyHStackView.swift
//  LazyLab
//
//  Created by Zeeshan Waheed on 31/03/2026.
//

import Foundation
import SwiftUI

struct LazyHStackView: View {
    
    @State private var showLargeData = false
    
    var data: [Int] {
        showLargeData ? Array(0..<1000) : Array(0..<20)
    }
    
    var body: some View {
        VStack {
            
            Toggle("Show 1000 items", isOn: $showLargeData)
                .padding()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(data, id: \.self) { item in
                        Text("Item \(item)")
                            .frame(width: 120, height: 100)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("LazyHStack")
    }
}
