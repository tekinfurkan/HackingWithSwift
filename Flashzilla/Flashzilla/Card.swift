//
//  Card.swift
//  Flashzilla
//
//  Created by Furkan on 14.11.2023.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th doctor who?", answer: "jared leto")
}
