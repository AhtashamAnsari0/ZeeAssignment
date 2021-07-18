//
//  ImagesListInteractorInterface.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

/**Interface confirmed by interactor*/
import Foundation

protocol ImagesListInteractorInterface {
    func fetchImages(with imageName: String)
    func saveSearchQuery(with query: String)
    func fetchSearchQuery()
}

