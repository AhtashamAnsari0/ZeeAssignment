//
//  ImagesViewControllerSuite.swift
//  ZeeAssignmentTests
//
//  Created by Ahtasham Ansari on 18/07/21.
//

import XCTest
@testable import ZeeAssignment

class ImagesViewControllerSuite: XCTestCase {
    var imagesViewController: ImagesViewController!

    override func setUp()  {
        self.imagesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImagesViewController") as? ImagesViewController
        let networkService = NetworkServiceMock()
        let configurationManager = ConfigurationManager()
        let router: ImagesListRouterInterface = ImagesListRouter()
        let imagesListInteractor = ImagesListInteractor(configurationManager: configurationManager)
        imagesListInteractor.networkServiceProtocol = networkService
        let imagesListPresenter = ImagesListPresenter(imagesListInteractorInterface: imagesListInteractor)
        imagesListInteractor.imagesListInteractortOutput = imagesListPresenter
        imagesListPresenter.imagesListRouterInterface = router
        self.imagesViewController.presenter = imagesListPresenter
        _ = self.imagesViewController.view
    }

    // MARK: Nil Checks
    func testCollectionDataSourceViewDataSource(){
        XCTAssertNotNil(self.imagesViewController.collectionView.dataSource)
    }

    func testCollectionDataSourceViewDelegate() {
        XCTAssertNotNil(self.imagesViewController.collectionView.delegate)
    }
    
    func testTableDataSourceViewDataSource(){
        XCTAssertNotNil(self.imagesViewController.tableView.dataSource)
    }

    func testTableDataSourceViewDelegate() {
        XCTAssertNotNil(self.imagesViewController.tableView.delegate)
    }
    
    func testSearchBarDataSourceViewDelegate() {
        XCTAssertNotNil(self.imagesViewController.searchBar.delegate)
    }


    // MARK: Number of items Checks
    func testViewNumberOfSections() {
        XCTAssertEqual(self.imagesViewController.tableView.numberOfSections, 1)
    }

}
