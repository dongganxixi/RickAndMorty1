//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/6/30.
//

import Foundation

struct RMLocation: Codable{
    
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [ String ]
    let url: String
    let created: String
}
