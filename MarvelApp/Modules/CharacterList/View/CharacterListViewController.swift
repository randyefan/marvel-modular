//
//  CharacterListViewController.swift
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
protocol CharacterListPresenterViewProtocol: AnyObject {
    // CharacterList Presenter to View Protocol
    func set(title: String?)
    func showLoading()
    func hideLoading()
    func showError(error: ErrorObject)
}

// MARK: -

/// The View Controller for the CharacterList module
class CharacterListViewController: UIViewController {
    
    // MARK: - Constants
    let presenter: CharacterListViewPresenterProtocol
    let disposeBag = DisposeBag()
    
    // MARK: Variables
    
    lazy var adapter: CharacterListAdapter = {
        let aAdapter = CharacterListAdapter(viewController: self)
        return aAdapter
    }()
    
    lazy var collectionView: UICollectionView = {
        return UICollectionView.createView(with: .clear)
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    // MARK: Outlets
    
    // MARK: Inits
    init(presenter: CharacterListViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        
        setupView()
        presenter.viewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.screenOpened()
    }
    
    func setupView() {
        // Setup View
        collectionView.constraintEdges(to: view.frame)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        view.backgroundColor = .blue
        
        view.setNeedsUpdateConstraints()
    }
    
    func setupNavBar() {
        // Setup NavBar
        setNavbarColor(to: .black)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Custom Functions
    
    // MARK: Outlet Action
}

extension CharacterListViewController: CharacterListPresenterViewProtocol {
    
    // MARK: - CharacterList Presenter to View Protocol
    func set(title: String?) {
        self.title = title
    }
}
