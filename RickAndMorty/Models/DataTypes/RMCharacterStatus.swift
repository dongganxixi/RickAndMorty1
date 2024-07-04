//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/7/1.
//

import Foundation

enum RMCharacterStatus: String, Codable{
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String{
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknow"
        }
    }
}

