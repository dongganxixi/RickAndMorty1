//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/7/1.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String{
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
