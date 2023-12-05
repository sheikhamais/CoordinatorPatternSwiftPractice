//
//  ItemsFlowCoordinator.swift
//  CoordinatorPatterPracticeApp
//
//  Created by Amais Sheikh on 05/12/2023.
//

import UIKit

class ItemsFlowCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let home = ItemsListingViewController()
        home.delegate = self
        navigationController.pushViewController(home, animated: true)
    }
    
    private func pushToDetails(selectedDetails: String) {
        let details = DetailsViewController(selectedDetail: selectedDetails)
        details.delegate = self
        navigationController.pushViewController(details, animated: true)
    }
    
    private func showDetailsPopover(selectedDetails: String) {
        let popover = DetailsPopoverViewController(selectedSubDetail: selectedDetails)
        navigationController.present(popover, animated: true)
    }
}

extension ItemsFlowCoordinator: ItemsListingViewControllerDelegate {
    func itemsListingViewController(_ controller: ItemsListingViewController, selectedItem: String) {
        pushToDetails(selectedDetails: selectedItem)
    }
}

extension ItemsFlowCoordinator: DetailsViewControllerDelegate {
    func detailsViewController(_ controller: DetailsViewController, selectedObject: String) {
        showDetailsPopover(selectedDetails: selectedObject)
    }
}
