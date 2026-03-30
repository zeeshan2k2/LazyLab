//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Zeeshan Waheed on 28/03/2026.
//

import SwiftUI

struct LazyContainerMenuView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let items: [LazyContainerItem] = [
        LazyContainerItem(type: .vStack, icon: "square.stack.3d.up"),
        LazyContainerItem(type: .hStack, icon: "square.stack.3d.up.fill"),
        LazyContainerItem(type: .vGrid, icon: "square.grid.2x2"),
        LazyContainerItem(type: .hGrid, icon: "rectangle.grid.2x2")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // MARK: - Heading
                    Text("Lazy Containers")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    Text("Explore lazy rendering behavior")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    // MARK: - Grid Menu
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(items) { item in
                            NavigationLink(destination: destinationView(for: item)) {
                                LazyMenuItemView(item: item)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    // MARK: - Navigation Mapping
    @ViewBuilder
    private func destinationView(for item: LazyContainerItem) -> some View {
        switch item.type {
        case .vStack:
            LazyVStackView()
        case .hStack:
            LazyHStackView()
        case .vGrid:
            LazyVGridView()
        case .hGrid:
            LazyHGridView()
        }
    }
}

// MARK: - Enum (Strong Identity)
enum LazyType: String {
    case vStack = "LazyVStack"
    case hStack = "LazyHStack"
    case vGrid  = "LazyVGrid"
    case hGrid  = "LazyHGrid"
}

// MARK: - Item Model
struct LazyContainerItem: Identifiable {
    let id = UUID()
    let type: LazyType
    let icon: String
    
    var title: String {
        type.rawValue
    }
}

// MARK: - Grid Item View
struct LazyMenuItemView: View {
    let item: LazyContainerItem
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: item.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
            
            Text(item.title)
                .font(.headline)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}

#Preview {
    LazyContainerMenuView()
        .preferredColorScheme(.dark)
}
