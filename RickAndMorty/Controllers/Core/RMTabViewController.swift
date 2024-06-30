//
//  ViewController.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/6/30.
//

import UIKit

final class RMTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    private func setUpTabs(){
        let charactersVC = RMCharacterViewController()
        let locationsVC = RMLocationrViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        
        let nav1 = UINavigationController(rootViewController: charactersVC)
        let nav2 = UINavigationController(rootViewController: locationsVC)
        let nav3 = UINavigationController(rootViewController: episodesVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        setViewControllers(
            [nav1, nav2, nav3, nav4],
            animated: true)
        
    }
    
}

