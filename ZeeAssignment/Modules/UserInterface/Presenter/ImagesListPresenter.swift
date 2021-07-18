//
//  ImagesListPresenter.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

/**Presenter for ImagesList module that communicates to interactor layer and delegates response to view*/
import Foundation
import IGListKit

class ImagesListPresenter: ImagesListPresenterInterface {
    
    weak var imagesListPresenterOutput: ImagesListPresenterOutput?
    var imagesListInteractorInterface : ImagesListInteractorInterface?
    var imagesListRouterInterface : ImagesListRouterInterface?
    var imagesList : [ImageData]?
    var searchQueryList : [SearchQuery]?
    var searchQuery: String?
    
    //MARK: Initializer
    init(imagesListInteractorInterface : ImagesListInteractorInterface) {
        self.imagesListInteractorInterface = imagesListInteractorInterface
    }
    
    //MARK: ImagesListPresenterInterface Mathod
    
    /**Custom mathod that  communicate to the  interactor to fetch imagesList */
    func viewDidLoad(with imageName:String) {
        if imageName.count > 0 {
            searchQuery = imageName
            self.imagesListPresenterOutput?.showLoading()
            self.imagesListInteractorInterface?.fetchImages(with: imageName)
        }
    }
    
    /**Custom mathod that  communicate  to the interactor for  fetch query from locally*/
    func loadSearchQuery() {
        self.imagesListInteractorInterface?.fetchSearchQuery()
    }

    /**Custom mathod that return images list count */
    func getImagesCount() -> Int {
        return imagesList?.count ?? 0
    }
    
    /**Custom mathod that retun ImageData  array*/
    func getImagesList()-> [ListDiffable] {
        imagesList ?? []
    }
    
    func getThumbnailImagesList()-> [Thumbnail] {
        imagesList?.compactMap {$0.thumbnail} ?? []
    }

    /**Custom mathod that retun ImageData object from ImageData images array*/
    func getImageData(index: Int) -> ImageData? {
        return imagesList?[index]
    }
    
    /**Custom mathod used to set empty imageslist*/
    func didSetEmptyImageList() {
        imagesList = []
    }
    
    /**Custom mathod that retun  locally saved search query  array*/
    func getSearchList()->[SearchQuery] {
        self.searchQueryList ?? []
    }
    
    /**Custom mathod that retun  locally saved search query  object*/
    func getSearchQuery(with index:Int) ->SearchQuery? {
        self.searchQueryList?.reversed()[index]
    }
    
    /**Custom mathod used  to push the controller*/
    func didSelectFor(index : Int) {
        guard let imageDetails = getImageData(index: index) else { return }
        imagesListRouterInterface?.pushImageDetailController(from: imagesListPresenterOutput, imageDetails: imageDetails)
    }
    
    /**Private  mathod used  to save search query locally*/
    private func saveSearchQueryLocally() {
        self.imagesListInteractorInterface?.saveSearchQuery(with: searchQuery ?? "")
    }

}

//MARK:- Protocol to delegate response back to presenter from interactor
extension ImagesListPresenter: ImagesListInteractorOutput {
    
    func didFetchImages(_ images: ImageList) {
        if let query = images.query {
            saveSearchQueryLocally()
            self.imagesList = query.pages?.imageList
            self.imagesListPresenterOutput?.showImages()
        } else {
            self.imagesListPresenterOutput?.showEmptyPopup()
        }
        self.imagesListPresenterOutput?.hideLoading()
        
    }
    
    func didFetchSearchQuery(_ searchList: [SearchQuery]) {
        self.searchQueryList = searchList
        self.imagesListPresenterOutput?.showSearchList()
    }
    
    func didGetErrorInImages(_ errr: Error) {
        self.imagesListPresenterOutput?.hideLoading()
        self.imagesListPresenterOutput?.showError(errorModel: ErrorImageViewModel(title: "Oops!", message: errr.localizedDescription))
    }
}
