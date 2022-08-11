//
//  CharacterListInteractor.swift
//  Project: MarvelApp
//
//  Module: CharacterList
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Imports
import Foundation
import SwiftyVIPER
import RxCocoa
import RxSwift

// MARK: Protocols
protocol CharacterListPresenterInteractorProtocol {
    // CharacterList Presenter to Interactor Protocol
    func requestTitle()
    func trackOpenScreen()
}

protocol CharacterListRemoteDataManagerOutputProtocol {
    func onError(error: ErrorObject)
}

// MARK: -

/// The Interactor for the CharacterList module
final class CharacterListInteractor {
    
    // MARK: - Variables
    private let disposeBag = DisposeBag()
    weak var presenter: CharacterListInteractorPresenterProtocol?
    var remoteDataManager: CharacterListRemoteDataManagerInputProtocol?
    
    init() {
        setupObserver()
    }
    
    func setupObserver() {}
}

extension CharacterListInteractor: CharacterListPresenterInteractorProtocol {
    
    // MARK: - CharacterList Presenter to Interactor Protocol
    func requestTitle() {
        presenter?.set(title: "CharacterList")
    }
    
    func trackOpenScreen() {}
}

extension CharacterListInteractor: CharacterListRemoteDataManagerOutputProtocol {
    
    func onError(error: ErrorObject) {
        presenter?.hideLoading()
        presenter?.onError(error: error)
    }
    
}
