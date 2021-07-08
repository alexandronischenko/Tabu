//
//  Cubic.swift
//  Tabu
//
//  Created by Alexandr Onischenko on 08.07.2021.
//

import Foundation

enum Cubic: CaseIterable{
    case classicRules
    case doubleTime
    case dontMove
    case allPlay
    case oneGuessing
    
    static func rollTheDice() -> Cubic{
        let random = Int.random(in: 0..<Cubic.allCases.count)
        return Cubic.allCases[random]
    }
}
