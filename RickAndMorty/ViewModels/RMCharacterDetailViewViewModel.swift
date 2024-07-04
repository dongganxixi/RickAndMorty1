//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/7/4.
//

import Foundation

final class RMCharacterDetailViewViewModel{
    let character: RMCharacter
    
    init(character: RMCharacter){
        self.character = character
    }
    
    public var title: String{
        character.name.uppercased()
    }
}
