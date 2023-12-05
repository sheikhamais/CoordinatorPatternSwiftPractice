//
//  HomeViewController.swift
//  CoordinatorPatterPracticeApp
//
//  Created by Amais Sheikh on 03/12/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var itemsListingButton: UIButton = {
        let obj = UIButton()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.setTitle("Items Listing", for: .normal)
        obj.setTitleColor(.black, for: .normal)
        obj.addTarget(self, action: #selector(didTapItemsListing), for: .touchUpInside)
        obj.backgroundColor = .darkGray
        return obj
    }()
    
    private lazy var salesListButton: UIButton = {
        let obj = UIButton()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.setTitle("Sales Listing", for: .normal)
        obj.addTarget(self, action: #selector(didTapSalesListing), for: .touchUpInside)
        obj.setTitleColor(.black, for: .normal)
        obj.backgroundColor = .darkGray
        return obj
    }()
    
    private var itemsFlow: ItemsFlowCoordinator?
    private var salesFlow: SalesFlowCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .lightGray
        view.addSubview(itemsListingButton)
        view.addSubview(salesListButton)
        
        NSLayoutConstraint.activate([
            itemsListingButton.widthAnchor.constraint(equalToConstant: 200),
            itemsListingButton.heightAnchor.constraint(equalToConstant: 40),
            itemsListingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemsListingButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            salesListButton.widthAnchor.constraint(equalToConstant: 200),
            salesListButton.heightAnchor.constraint(equalToConstant: 40),
            salesListButton.topAnchor.constraint(equalTo: itemsListingButton.bottomAnchor, constant: 12),
            salesListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func didTapItemsListing() {
        guard let navigation = self.navigationController else { return }
        let flow = ItemsFlowCoordinator(navigationController: navigation)
        flow.start()
        self.itemsFlow = flow
    }
    
    @objc private func didTapSalesListing() {
        guard let navigation = self.navigationController else { return }
        let flow = SalesFlowCoordinator(navigationController: navigation)
        flow.start()
        self.salesFlow = flow
    }
}
