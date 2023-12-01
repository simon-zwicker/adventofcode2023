//
//  DayOneView.swift
//  AdventOfCode2023
//
//  Created by Simon Zwicker on 01.12.23.
//

import SwiftUI

struct DayOneView: View {

    @State var viewModel = DayOneViewModel()

    var body: some View {

        VStack(spacing: 25.0) {
            Button(action: {
                viewModel.run()
            }, label: {
                Text("Solve Puzzle")
                    .font(.system(size: 20.0))
                    .foregroundStyle(.white)
            })
            .padding()
            .background(Color.teal)
            .clipShape(.rect(cornerRadius: 10.0))

            VStack {
                Text("Answer Puzzle One:")
                    .font(.system(size: 18.0, weight: .bold))

                Text(viewModel.puzzleOne)
                    .font(.largeTitle)
                    .foregroundStyle(.teal)
            }

            VStack {
                Text("Answer Puzzle Two:")
                    .font(.system(size: 18.0, weight: .bold))

                Text(viewModel.puzzleTwo)
                    .font(.largeTitle)
                    .foregroundStyle(.teal)
            }
        }
        .navigationTitle(Menu.day1.rawValue)
    }
}

#Preview {
    DayOneView()
}
