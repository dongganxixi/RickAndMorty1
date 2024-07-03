//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/7/3.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
