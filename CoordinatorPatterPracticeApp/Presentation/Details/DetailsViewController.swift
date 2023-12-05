//
//  DetailsViewController.swift
//  CoordinatorPatterPracticeApp
//
//  Created by Amais Sheikh on 03/12/2023.
//

import UIKit

protocol DetailsViewControllerDelegate: AnyObject {
    func detailsViewController(_ controller: DetailsViewController, selectedObject: String)
}

class DetailsViewController: UIViewController {
    
    private lazy var nameMe: UIButton = {
        let obj = UIButton()
        obj.translatesAutoresizingMaskIntoConstraints = false
        let name = String(describing: DetailsViewController.self)
        obj.setTitle(name, for: .normal)
        obj.setTitleColor(.black, for: .normal)
        obj.addTarget(self, action: #selector(didTapNameMe), for: .touchUpInside)
        obj.backgroundColor = .darkGray
        return obj
    }()
    
    weak var delegate: DetailsViewControllerDelegate?
    private var selectedDetail: String
    
    init(selectedDetail: String) {
        self.selectedDetail = selectedDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .lightGray
        view.addSubview(nameMe)
        self.title = selectedDetail
        
        NSLayoutConstraint.activate([
            nameMe.widthAnchor.constraint(equalToConstant: 200),
            nameMe.heightAnchor.constraint(equalToConstant: 40),
            nameMe.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameMe.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func didTapNameMe() {
        delegate?.detailsViewController(self, selectedObject: "Selected a detail")
    }
}
