//
//  RMServie.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/7/1.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMServie{
    /// Shared singleton instance
    static let shared = RMServie()
    
    /// Privatized constructor
    private init(){}
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: request instance
    ///   - type : The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest ,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void){
        
    }
    
}
