//
//  ImagesListInteractorSuite.swift
//  ZeeAssignmentTests
//
//  Created by Ahtasham Ansari on 18/07/21.
//

import XCTest
@testable import ZeeAssignment

class ImagesListInteractorSuite: XCTestCase {
    var imagesListInteractor: ImagesListInteractor?

    override func setUp()  {
        let networkServiceMock = NetworkServiceMock()
        let configurationManager = ConfigurationManager()
        imagesListInteractor = ImagesListInteractor(configurationManager: configurationManager)
        imagesListInteractor?.networkServiceProtocol = networkServiceMock
    }
    
    func testFetchPopularMovieType() {
        //When
        imagesListInteractor?.fetchImages(with: "iphone")

        //Then
        XCTAssertTrue((imagesListInteractor?.images) != nil)
    }
    
    func testFetchPopularMoviesCount() {
        //Given
        let totalCount = 10

        //When
        imagesListInteractor?.fetchImages(with: "iphone")

        //Then
        XCTAssertEqual(imagesListInteractor?.images?.query?.pages?.imageList?.count, totalCount, "Error in response data")

    }

}
