//
//  ContactCell.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 22/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

struct ContactCell: Codable {
    let id: Int
    let type: Int
    let message: String
    let typefield: Int?
    let hidden: Bool
    let topSpacing: Double
    let show: Int?
    let required: Bool
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        type = try container.decode(Int.self, forKey: .type)
        message = try container.decode(String.self, forKey: .message)
        hidden = try container.decode(Bool.self, forKey: .hidden)
        topSpacing = try container.decode(Double.self, forKey: .topSpacing)
        show = try container.decode(Int?.self, forKey: .show)
        required = try container.decode(Bool.self, forKey: .required)
        
//      Como o JSON está vindo com o campo typedfield inconsistente (Alguns como inteiro outros como string)
//      é necessário fazer esse bloco de código para englobar os dois tipos
        do {
            typefield = try container.decode(Int?.self, forKey: .typefield)
        } catch {
            let typefieldToConvert = try container.decode(String?.self, forKey: .typefield)
            
            switch typefieldToConvert {
            case "text":
                typefield = 1
            case "telnumber":
                typefield = 2
            case "email":
                typefield = 3
            default:
                typefield = nil
            }
        }
    }
}
