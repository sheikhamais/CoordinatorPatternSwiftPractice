//
//  DetailsPopoverViewController.swift
//  CoordinatorPatterPracticeApp
//
//  Created by Amais Sheikh on 03/12/2023.
//

import Foundation
import UIKit

class DetailsPopoverViewController: UIViewController {
    
    private lazy var nameMe: UIButton = {
        let obj = UIButton()
        obj.translatesAutoresizingMaskIntoConstraints = false
//        let name = String(describing: DetailsPopoverViewController.self)
        obj.setTitle(selectedSubDetail, for: .normal)
        obj.setTitleColor(.black, for: .normal)
        obj.backgroundColor = .darkGray
        return obj
    }()
    
    private var selectedSubDetail: String
    
    init(selectedSubDetail: String) {
        self.selectedSubDetail = selectedSubDetail
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
//        self.title = selectedSubDetail
        
        NSLayoutConstraint.activate([
            nameMe.widthAnchor.constraint(equalToConstant: 200),
            nameMe.heightAnchor.constraint(equalToConstant: 40),
            nameMe.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameMe.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
