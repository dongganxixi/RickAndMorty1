//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/7/4.
//

import UIKit

/// Cotroller to show info about single character
final class RMCharacterDetailViewController: UIViewController {

    init(viewModel: RMCharacterDetailViewViewModel ) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    

}
