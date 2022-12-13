//
//  ShipsModels.swift
//  JustoTestFRR
//
//  Created by Felipe Romano on 12/12/22.
//


import Foundation

// MARK: - ShipsModelElement
struct ShipsModelElement:Codable {
    let ship_id, ship_name: String?
    let ship_model: String?
    let ship_type: String?
    let roles: [String]?
    let active: Bool?
    let imo: Int?
    let mmsi: Int?
    let abs, shipsModelClass, weightLbs, weightKg: Int?
    let yearBuilt: Int?
    let home_port, status: String?
    let missions: [Mission]?
    let url: String?
    let image: String?
}

// MARK: - Mission
struct Mission:Codable {
    let name: String?
    let flight: Int?
}


