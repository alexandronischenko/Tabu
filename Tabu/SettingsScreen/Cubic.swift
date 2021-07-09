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
    
    //MARK: TODO - write detailed description for users to understand each game mode
    var description: String {
        switch self {
        case .allPlay: return "General Mode"
        case .dontMove: return "No Movement"
        case .oneGuessing: return "Only one guesser from a team"
        case .doubleTime: return "Double time for both teams"
        case .classicRules: return "Classic Rules"
        }
    }
}
