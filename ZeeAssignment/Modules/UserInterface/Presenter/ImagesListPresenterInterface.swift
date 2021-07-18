//
//  ImagesListPresenterInterface.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

/**Interface confirmed by presenter*/
import Foundation
import IGListKit

protocol ImagesListPresenterInterface {
    func viewDidLoad(with imageName:String)
    func loadSearchQuery()
    func getImagesCount() -> Int
    func getImageData(index: Int) -> ImageData?
    func getImagesList()-> [ListDiffable]
    func getSearchList()->[SearchQuery]
    func getSearchQuery(with index:Int) ->SearchQuery?
    func didSelectFor(index : Int)
    func didSetEmptyImageList()
}
