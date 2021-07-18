//
//  ImagesListInteractorOutput.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

/**Protocol to delegate response back to presenter from interactor*/
import Foundation

protocol ImagesListInteractorOutput : AnyObject {
    func didFetchImages(_ images: ImageList)
    func didFetchSearchQuery(_ searchList: [SearchQuery])
    func didGetErrorInImages(_ errr: Error)
}
