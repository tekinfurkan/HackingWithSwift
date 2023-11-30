//
//  Resort.swift
//  SnowSeeker
//
//  Created by Furkan on 24.11.2023.
//

import Foundation

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    var facilityTypes: [Facility] {
        var newFacilites = [Facility]()
        for facility in facilities {
            newFacilites.append(Facility(name: facility))
        }
        return newFacilites
    }
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example: Resort = allResorts[0]
}
