//
//  String.swift
//  AdventOfCode2023
//
//  Created by Simon Zwicker on 01.12.23.
//

import Foundation

extension String {
    var isNumber: Bool {
        let characters = CharacterSet.decimalDigits
        return CharacterSet(charactersIn: self).isSubset(of: characters)
    }

    func replaceStringNumbers() -> String {
        var stringWithNumbers = self
        for number in FindReplace.allCases {
            stringWithNumbers = stringWithNumbers.replacingOccurrences(of: number.rawValue, with: number.numberString)
        }
        return stringWithNumbers
    }

    func firstLastNumber() -> (string: String, raw: Int?) {
        var first: String?
        var second: String?

        for char in self {
            let charString = "\(char)"
            guard charString.isNumber else { continue }
            if first == nil {
                first = charString
            } else {
                second = charString
            }
        }

        let stringNumber = "\(first ?? "")\(second ?? first ?? "")"

        return (string: stringNumber, raw: Int(stringNumber))
    }
}
