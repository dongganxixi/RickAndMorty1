//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/7/3.
//

import UIKit

protocol RMCharacterListViewDelegate: AnyObject{
    func rmCharacterListView(
        _ characterListView: RMCharacterListView,
        didSelecteCharacter character: RMCharacter
    )
}

/// View that handles showing list of characters, loaders, etc.
final class RMCharacterListView: UIView {
    
    public weak var delegate:  RMCharacterListViewDelegate?
    
    private let viewModel = RMCharacterListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self,
                                forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)
        
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView , spinner)
        addCconstraints()
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchCharacters()
        setUpCollectionView()
    }
    required init?(coder: NSCoder){
        fatalError("Unsupported")
    }
    
    private func addCconstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    func setUpCollectionView(){
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
    }
    
}


extension RMCharacterListView: RMCharacterListViewViewModelDelegate{
    func didSelectCharacter(_ character: RMCharacter) {
        delegate?.rmCharacterListView(self, didSelecteCharacter: character)
    }
    
    func didLoadInitialCharacters() {
        spinner.stopAnimating()
        self.collectionView.isHidden = false
        collectionView.reloadData() // Initial fetch 
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
        
    }
}
