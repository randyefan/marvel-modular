//
//  CharacterListRemoteDataManager.swift
//  Project: MarvelApp
//
//  Module: CharacterList
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Imports
import UIKit

// MARK: Protocols
protocol CharacterListRemoteDataManagerInputProtocol: AnyObject {
    // CharacterList Interactor to Remote Data Manager Protocol
}

// MARK: -

/// The DataManager for the CharacterList module
class CharacterListRemoteDataManager: CharacterListRemoteDataManagerInputProtocol {
    
    // MARK: - Variables
    var interactor: CharacterListRemoteDataManagerOutputProtocol
    
    // List ApiManager
    
    // MARK: - CharacterList Remote Data Manager to ApiInterface Protocol
    
    // MARK: Inits
    required init(interactor: CharacterListRemoteDataManagerOutputProtocol) {
        self.interactor = interactor
    }
    
}

extension CharacterListRemoteDataManager: ApiInterfaceDelegate {
    
    // MARK: - ApiInterface to CharacterList Remote Data Manager Protocol
    func onSuccess(interface: ApiInterface?, object: Any) {}
    
    func onFailed(interface: ApiInterface?, errorCode: String?, message: String, errorHandlerType: ErrorHandlerType, otherInfo: Any? = nil) {
        // TODO: Add failed handler
        let error = ErrorObject(errorCode: errorCode, message: message, errorHandlerType: errorHandlerType)
        interactor.onError(error: error)
    }
    
}
