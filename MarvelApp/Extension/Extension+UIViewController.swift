//
//  Extension+UIViewController.swift
//  MarvelApp
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    func setNavbarColor(to color: UIColor?, textColor: UIColor? = .white, isTranslucent: Bool = false, isGareth: Bool = false) {
        let titleTextAttributes: [NSAttributedString.Key: Any]  = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21, weight: .bold), NSAttributedString.Key.foregroundColor: textColor ?? UIColor.white]
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = .clear
            appearance.backgroundColor = color
            appearance.titleTextAttributes = titleTextAttributes
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.barTintColor = color
            navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
            navigationController?.navigationBar.tintColor = nil
        }
        
        navigationController?.navigationBar.isTranslucent = isTranslucent
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func showLoading() {
        // Do Nothing
    }
    
    func hideLoading() {
        // Do Nothing
    }
    
    func showError(error: ErrorObject) {
        // Do Nothing
    }
}
