//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/6/30.
//

import Foundation

struct RMEpisode: Codable{
  let id: Int
  let name: String
  let air_date: String
  let episode: String
  let characters: [ String ]
  let url: String
  let created: String
}
