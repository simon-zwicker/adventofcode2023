//
//  HomeView.swift
//  AdventOfCode2023
//
//  Created by Simon Zwicker on 01.12.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List(Menu.allCases, id: \.self) { menu in
                NavigationLink(value: menu) {
                    Text(menu.rawValue)
                }
            }
            .navigationTitle("AdventOfCode 2023")
            .navigationDestination(for: Menu.self) { menu in
                menu.view
            }
        }
    }
}

#Preview {
    HomeView()
}
