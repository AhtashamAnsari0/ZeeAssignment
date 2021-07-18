//
//  ImagesListRouter.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

/**Router for  ImageList module.  used for data passing, creating dependencies and navigation flow */
import UIKit
class ImagesListRouter :ImagesListRouterInterface {

    static func createImagesListListModule() -> UIViewController {
        // Create layers
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ImagesNavigationController")
        if let view = navController.children.first as? ImagesViewController {
            let networkService = NetworkService()
            let configurationManager = ConfigurationManager()
            let router: ImagesListRouterInterface = ImagesListRouter()
            let imagesListInteractor = ImagesListInteractor(configurationManager: configurationManager)
            let imagesListPresenter = ImagesListPresenter(imagesListInteractorInterface: imagesListInteractor)
            imagesListInteractor.imagesListInteractortOutput = imagesListPresenter
            imagesListInteractor.networkServiceProtocol = networkService
            imagesListPresenter.imagesListPresenterOutput = view
            imagesListPresenter.imagesListRouterInterface = router
            view.presenter = imagesListPresenter
            return navController
        }
        return UIViewController()
    }
    
    static func createImageDetailModule(with imageDetail : ImageData) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ImageDetailViewController")
        if let view = viewController as? ImageDetailViewController {
            view.imageDetails = imageDetail
            return viewController
        }
        return UIViewController()
    }
    

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    func pushImageDetailController(from view: ImagesListPresenterOutput?, imageDetails: ImageData) {
        let imagesDetailViewController = ImagesListRouter.createImageDetailModule(with: imageDetails)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(imagesDetailViewController, animated: true)
        }
    }
}
