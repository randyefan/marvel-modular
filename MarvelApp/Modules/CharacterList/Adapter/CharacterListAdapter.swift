//
//  CharacterListAdapter.swift
//  Project: MarvelApp
//
//  Module: CharacterList
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: Imports
import UIKit
import IGListKit
import RxCocoa
import RxSwift

// MARK: Protocols

// MARK: -

/// The Adapter for the CharacterList module
final class CharacterListAdapter: ListAdapter {
    
    // MARK: - Constants
    
    // MARK: Variables
    var listDiffable: [ListDiffable] = []
    
    // MARK: Inits
    init(viewController: UIViewController?) {
        super.init(updater: ListAdapterUpdater(), viewController: viewController, workingRangeSize: 0)
        self.setupListDiffable()
        
        self.dataSource = self
    }
    
    // MARK: - Custom Functions
    func setupListDiffable() {
        var list: [ListDiffable] = []
        
        // Add ListDiffable here
        
        listDiffable = list
    }
    
    override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return listDiffable
    }
    
    override func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
