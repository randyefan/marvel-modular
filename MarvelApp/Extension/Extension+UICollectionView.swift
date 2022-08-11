//
//  Extension+UICollectionVie.swift
//  MarvelApp
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//

import UIKit

extension UICollectionView {
    class func createView(with backgroundColor: UIColor? = nil) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: AppHelper.shared.screenWidth, height: 0), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        if backgroundColor != nil {
            collectionView.backgroundColor = backgroundColor
        } else {
            collectionView.backgroundColor = .white
        }
        return collectionView
    }
}
