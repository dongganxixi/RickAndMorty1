//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/7/3.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel{
    
public let characterName: String
private let characterStatus: RMCharacterStatus
private let characterNameUrl: URL?
    
    // MARK: - Init
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterNameUrl: URL?
        
    ){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterNameUrl = characterNameUrl
    }
    public var characterStatusText: String{
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void){
        // TODO: Abstract to Image Manager
        guard let url = characterNameUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data , error == nil else{
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
