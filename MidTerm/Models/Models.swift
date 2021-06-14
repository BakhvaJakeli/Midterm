//
//  Models.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import Foundation

struct TheGame: Codable {
    var games: [Game]
}

// MARK: - Game
struct Game: Codable {
    var questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let question: String
    let content: [String]
    let correct: Int
}
