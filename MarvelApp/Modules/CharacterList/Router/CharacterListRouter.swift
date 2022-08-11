//
//  CharacterListRouter.swift
//  Project: MarvelApp
//
//  Module: CharacterList
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Imports
import UIKit
import SwiftyVIPER
import RxSwift

// MARK: Protocols
protocol CharacterListPresenterRouterProtocol: PresenterRouterProtocol {
    // CharacterList Presenter to Router Protocol
    
}

// MARK: -

/// The Router for the CharacterList module
final class CharacterListRouter: RouterProtocol {
    
    // MARK: - Variables
    weak var viewController: UIViewController?
}

extension CharacterListRouter: CharacterListPresenterRouterProtocol {
    
    // MARK: - CharacterList Presenter to Router Protocol
}
