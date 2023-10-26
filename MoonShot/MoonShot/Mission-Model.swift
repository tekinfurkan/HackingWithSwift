//
//  Mission-Model.swift
//  MoonShot
//
//  Created by Furkan on 20.10.2023.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let role: String
        let name: String
    }
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var image: String {
        "Apollo\(id)"
    }
    var displayName: String {
        "Apollo \(id)"
    }
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
