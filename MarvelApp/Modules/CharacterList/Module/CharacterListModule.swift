//
//  CharacterListModule.swift
//  Project: MarvelApp
//
//  Module: CharacterList
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Imports
import SwiftyVIPER
import UIKit
import RxSwift

// MARK: -

/// Used to initialize the CharacterList VIPER module
final class CharacterListModule: ModuleProtocol {
    
    // MARK: - Variables
    private(set) lazy var interactor: CharacterListInteractor = {
        CharacterListInteractor()
    }()
    
    private(set) lazy var router: CharacterListRouter = {
        CharacterListRouter()
    }()
    
    private(set) lazy var presenter: CharacterListPresenter = {
        CharacterListPresenter(router: self.router, interactor: self.interactor)
    }()
    
    private(set) lazy var view: CharacterListViewController = {
        CharacterListViewController(presenter: self.presenter)
    }()
    
    private(set) lazy var remoteDataManager: CharacterListRemoteDataManager = {
        CharacterListRemoteDataManager(interactor: interactor)
    }()
    
    // MARK: - Module Protocol Variables
    var viewController: UIViewController {
        return view
    }
    
    // MARK: Inits
    init() {
        presenter.view = view
        router.viewController = view
        interactor.presenter = presenter
        interactor.remoteDataManager = remoteDataManager
    }
}
