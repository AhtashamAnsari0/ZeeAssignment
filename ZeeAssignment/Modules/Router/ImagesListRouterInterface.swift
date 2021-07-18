//
//  ImagesListRouterInterface.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 15/07/21.
//

import Foundation

/**Intercase to be confirmed by Router of ImageList module */
import UIKit
protocol ImagesListRouterInterface {
    static func createImagesListListModule() -> UIViewController
    static func createImageDetailModule(with imageDetail : ImageData) -> UIViewController
    func pushImageDetailController(from view: ImagesListPresenterOutput?, imageDetails: ImageData)
}
