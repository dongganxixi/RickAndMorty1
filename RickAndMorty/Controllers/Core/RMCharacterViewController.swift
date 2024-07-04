//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/6/30.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController, RMCharacterListViewDelegate{
   
    
    private let  characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpView()
    }
    private func setUpView(){
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    // -MARK: rmCharacterListViewDelegate
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelecteCharacter character: RMCharacter) {
        // Open detail controller for that character
    }
    
}



