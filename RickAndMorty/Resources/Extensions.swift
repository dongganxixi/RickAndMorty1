//
//  Extensions.swift
//  RickAndMorty
//
//  Created by 胡瑞兴 on 2024/7/3.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
    
}
