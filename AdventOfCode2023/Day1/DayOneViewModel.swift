//
//  PuzzleOneViewModel.swift
//  AdventOfCode2023
//
//  Created by Simon Zwicker on 01.12.23.
//

import Foundation

struct DayOneModel {
    let codeString: String
    var numberString: String = ""
    var numberRaw: Int = 0
    let codeReplacedString: String
    var numberReplacedString: String = ""
    var numberReplacedRaw: Int = 0
}

enum FindReplace: String, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine

    var numberString: String {
        switch self {
        case .one:
            "one1one"
        case .two:
            "two2two"
        case .three:
            "three3three"
        case .four:
            "four4four"
        case .five:
            "five5five"
        case .six:
            "six6six"
        case .seven:
            "seven7seven"
        case .eight:
            "eight8eight"
        case .nine:
            "nine9nine"
        }
    }
}

@Observable
class DayOneViewModel {

    var puzzleCodes: [DayOneModel] = []

    var puzzleOne: String = ""
    var puzzleTwo: String = ""

    func run() {
        readFile()
        setPuzzleNumber()
        calculateSum()
    }

    private func setPuzzleNumber() {
        guard !puzzleCodes.isEmpty else { return }

        var newCodes: [DayOneModel] = []
        for code in puzzleCodes {
            let numbers = code.codeString.firstLastNumber()
            let numbersReplaced = code.codeReplacedString.firstLastNumber()
            newCodes.append(
                DayOneModel(
                    codeString: code.codeString,
                    numberString: numbers.string,
                    numberRaw: numbers.raw ?? 0,
                    codeReplacedString: code.codeReplacedString,
                    numberReplacedString: numbersReplaced.string,
                    numberReplacedRaw: numbersReplaced.raw ?? 0
                )
            )
        }

        puzzleCodes = newCodes
    }

    private func calculateSum() {
        var sumOne: Int = 0
        var sumTwo: Int = 0
        for code in puzzleCodes {
            sumOne += code.numberRaw
            sumTwo += code.numberReplacedRaw
        }

        puzzleOne = "\(sumOne)"
        puzzleTwo = "\(sumTwo)"
    }

    private func readFile() {
        guard
            let path = Bundle.main.path(forResource: "DayOneInput", ofType: "txt"),
            let file = try? String(contentsOfFile: path)
        else { return }
        let codes = file.components(separatedBy: "\n")
        puzzleCodes = codes.compactMap({ DayOneModel(codeString: $0, codeReplacedString: $0.replaceStringNumbers()) })
    }
}
