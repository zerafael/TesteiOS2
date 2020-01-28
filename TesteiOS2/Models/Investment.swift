//
//  Investment.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 27/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

struct Investment: Codable {
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infotitle: String
    let moreInfo: MoreInfo
    let info: [Info]
    let downInfo: [Info]
}

struct MoreInfo: Codable {
    let month: PeriodInfo
    let year: PeriodInfo
    let twelveMonths: PeriodInfo
    
    enum CodingKeys: String, CodingKey {
        case month
        case year
        case twelveMonths = "12months"
    }
}

struct PeriodInfo: Codable {
    let fund: Double
    let CDI: Double
}

struct Info: Codable {
    let name: String
    let data: String?
}
