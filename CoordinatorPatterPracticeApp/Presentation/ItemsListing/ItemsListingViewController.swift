//
//  ItemsListingViewController.swift
//  CoordinatorPatterPracticeApp
//
//  Created by Amais Sheikh on 03/12/2023.
//

import Foundation
import UIKit

protocol ItemsListingViewControllerDelegate: AnyObject {
    func itemsListingViewController(_ controller: ItemsListingViewController, selectedItem: String)
}

class ItemsListingViewController: UIViewController {
    
    private lazy var nameMe: UIButton = {
        let obj = UIButton()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.setTitle("Grocery Item", for: .normal)
        obj.setTitleColor(.black, for: .normal)
        obj.addTarget(self, action: #selector(didTapNameMe), for: .touchUpInside)
        obj.backgroundColor = .darkGray
        return obj
    }()
    
    weak var delegate: ItemsListingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .lightGray
        view.addSubview(nameMe)
        self.title = String(describing: ItemsListingViewController.self)
        
        NSLayoutConstraint.activate([
            nameMe.widthAnchor.constraint(equalToConstant: 200),
            nameMe.heightAnchor.constraint(equalToConstant: 40),
            nameMe.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameMe.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func didTapNameMe() {
        delegate?.itemsListingViewController(self, selectedItem: "Grocery Item")
    }
}
