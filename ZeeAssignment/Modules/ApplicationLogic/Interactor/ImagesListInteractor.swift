//
//  ImagesListInteractor.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

import Foundation
import RxSwift

/**Interactor for ImageList module that communicates to service layer and delegates response to presenter*/
class ImagesListInteractor: ImagesListInteractorInterface {

    /** ImagesListInteractorOutput object used  send response  to presenter*/
    weak var imagesListInteractortOutput : ImagesListInteractorOutput?
    /** ConfigurationManager object used for api url*/
    let configurationManager : ConfigurationManager
    /** NetworkServiceProtocol object used to communnicate with network service.*/
    var networkServiceProtocol : NetworkServiceProtocol?
    var images : ImageList?
    let bag: DisposeBag
    
    //MARK: Initializer
    init(configurationManager : ConfigurationManager) {
        self.configurationManager = configurationManager
        bag = DisposeBag()
    }
    
    /** Custom mathod used to fech images list from server*/
    func fetchImages(with imageName: String) {
        if let fetchImagesUrl = configurationManager.buildURL(for: imageName) {
            networkServiceProtocol?.loadFromServer(fetchImagesUrl, parameters: [:], type: ImageList.self).subscribe { list in
                self.images = list
                self.imagesListInteractortOutput?.didFetchImages(list)
            } onFailure: { error in
                print(error)
                self.imagesListInteractortOutput?.didGetErrorInImages(error)
            }.disposed(by: bag)
        }
    }
    
    /** Custom mathod used to save the query to CoreDataManager*/
    func saveSearchQuery(with query: String) {
        CoreDataManager.shareInstance.saveSearchQuery(with: query)
    }
    
    /** Custom mathod used to fech saved query from CoreDataManager*/
    func fetchSearchQuery() {
        if let searchList = CoreDataManager.shareInstance.fetchSearchQuery() {
            self.imagesListInteractortOutput?.didFetchSearchQuery(searchList)
        }
    }
}
