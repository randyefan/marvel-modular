//
//  Extension+ListAdapter.swift
//  MarvelApp
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//

import UIKit
import IGListKit

extension ListAdapter: ListAdapterDataSource {
    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        []
    }
    
    public func emptyView(for listAdapter: ListAdapter) -> UIView? {
        nil
    }
    
    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        default:
            return ListSectionController()
        }
    }
    
    
}
