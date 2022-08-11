//
//  CharacterListPresenter.swift
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
protocol CharacterListViewPresenterProtocol: ViewPresenterProtocol {
    // CharacterList View to Presenter Protocol
    func screenOpened()
}

protocol CharacterListInteractorPresenterProtocol: AnyObject {
    // CharacterList Interactor to Presenter Protocol
    func set(title: String?)
    func onError(error: ErrorObject)
    func showLoading()
    func hideLoading()
}

// MARK: -

/// The Presenter for the CharacterList module
final class CharacterListPresenter {
    
    // MARK: - Constants
    let router: CharacterListPresenterRouterProtocol
    let interactor: CharacterListPresenterInteractorProtocol
    
    // MARK: Variables
    weak var view: CharacterListPresenterViewProtocol?
    
    // MARK: Inits
    init(router: CharacterListPresenterRouterProtocol, interactor: CharacterListPresenterInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewLoaded() {
        interactor.requestTitle()
    }
}

extension CharacterListPresenter: CharacterListInteractorPresenterProtocol {
    
    // MARK: - CharacterList Interactor to Presenter Protocol
    func set(title: String?) {
        view?.set(title: title)
    }
    
    func onError(error: ErrorObject) {
        view?.showError(error: error)
    }
    
    func showLoading() {
        view?.showLoading()
    }
    
    func hideLoading() {
        view?.hideLoading()
    }
}

extension CharacterListPresenter: CharacterListViewPresenterProtocol {
    
    // MARK: - CharacterList View to Presenter Protocol
    func screenOpened() {
        interactor.trackOpenScreen()
    }
}
