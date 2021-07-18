//
//  ImagesListPresenterOutput.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

/**Protocol to delegate response back to view from presenter*/
import Foundation

protocol ImagesListPresenterOutput : AnyObject {
    func showImages()
    func showEmptyPopup()
    func showSearchList()
    func showError(errorModel : ErrorImageViewModel)
    func showLoading()
    func hideLoading()
}

