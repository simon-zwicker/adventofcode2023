//
//  Menu.swift
//  AdventOfCode2023
//
//  Created by Simon Zwicker on 01.12.23.
//

import SwiftUI

enum Menu: String, CaseIterable {
    case day1 = "Tag 1"

    @ViewBuilder
    var view: some View {
        switch self {
        case .day1: DayOneView()
        }
    }
}
