//
//  SaleOffersViewController.swift
//  CoordinatorPatterPracticeApp
//
//  Created by Amais Sheikh on 03/12/2023.
//

import Foundation
import UIKit

protocol SaleOffersViewControllerDelegate: AnyObject {
    func saleOffersViewController(_ controller: SaleOffersViewController, selectedSale: String)
}

class SaleOffersViewController: UIViewController {
    
    private lazy var nameMe: UIButton = {
        let obj = UIButton()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.setTitle("Aurora Sale", for: .normal)
        obj.setTitleColor(.black, for: .normal)
        obj.addTarget(self, action: #selector(didTapNameMe), for: .touchUpInside)
        obj.backgroundColor = .darkGray
        return obj
    }()
    
    weak var delegate: SaleOffersViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .lightGray
        view.addSubview(nameMe)
        self.title = String(describing: SaleOffersViewController.self)
        
        NSLayoutConstraint.activate([
            nameMe.widthAnchor.constraint(equalToConstant: 200),
            nameMe.heightAnchor.constraint(equalToConstant: 40),
            nameMe.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameMe.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func didTapNameMe() {
        delegate?.saleOffersViewController(self, selectedSale: "Aurora Sale")
    }
}
