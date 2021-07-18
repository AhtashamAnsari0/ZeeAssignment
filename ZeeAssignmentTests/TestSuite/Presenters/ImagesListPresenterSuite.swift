//
//  ImagesListPresenterSuite.swift
//  ZeeAssignmentTests
//
//  Created by Ahtasham Ansari on 18/07/21.
//

import XCTest
@testable import ZeeAssignment

class ImagesListPresenterSuite: XCTestCase {
    var imagesListPresenter : ImagesListPresenter?

    override func setUp()  {
        let networkServiceMock = NetworkServiceMock()
        let configurationManager = ConfigurationManager()
        let imagessListInteractor = ImagesListInteractor(configurationManager: configurationManager)
        imagesListPresenter = ImagesListPresenter(imagesListInteractorInterface: imagessListInteractor)
        imagessListInteractor.networkServiceProtocol = networkServiceMock
        imagessListInteractor.imagesListInteractortOutput = imagesListPresenter
        imagesListPresenter?.viewDidLoad(with: "iphone")
    }

    func testViewDidLoad() {
        //Given
        let totalCount = 10
        //When
        let count = imagesListPresenter?.getImagesCount()

        //Then
        XCTAssertEqual(count, totalCount, "Error in response data")
    }

}
