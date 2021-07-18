//
//  ViewController.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 13/07/21.
//

/**View controller Used to display the images in a grid*/
import UIKit
import IGListKit

class ImagesViewController: UIViewController {
    
    /**UICollectionView Used to  display images in a grid*/
    @IBOutlet weak var collectionView: UICollectionView!
    /**UITableView Used to  display recent search queries*/
    @IBOutlet weak var tableView: UITableView!
    /**UISearchBar Used to  search queries*/
    @IBOutlet var searchBar: UISearchBar!
    
    /** UIActivityIndicatorView use for loader animating */
    var activityIndicator = UIActivityIndicatorView()
    
    var presenter: ImagesListPresenterInterface?
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    // MARK: - Private methods used for inital setup
    private func initialSetup() {
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        adapter.collectionView = collectionView
        adapter.dataSource = self
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = false
        presenter?.loadSearchQuery()
    }
    
    // MARK: - Custom internal mathod 
     func loadSearchQuery(with imageName: String) {
        searchBar.resignFirstResponder()
        tableView.isHidden = true
        presenter?.viewDidLoad(with: imageName)
    }
}


// MARK: IGListKit ListAdapterDataSource
extension ImagesViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        presenter?.getImagesList() ?? []
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController = ImagesSectionController()
        sectionController.delegate = self
        return sectionController
    }
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}


//MARK:- Extension UISearchBar Delegate Mathod
extension ImagesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.count ?? 0 > 0 {
            loadSearchQuery(with: searchBar.text ?? "")
        } else {
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            tableView.isHidden = false
            presenter?.loadSearchQuery()
            presenter?.didSetEmptyImageList()
        } else {
            if presenter?.getImagesCount() ?? 0 > 0 {
                tableView.isHidden = true
            } else {
                tableView.isHidden = false
                presenter?.loadSearchQuery()
            }
        }
    }
}

// MARK: - Extension ImagesListPresenterOutputDelegate
extension ImagesViewController: ImagesListPresenterOutput, ActivityIndicatorPresenter {
    
    func showImages() {
        DispatchQueue.main.async {
            self.adapter.reloadData()
        }
    }
    
    func showEmptyPopup() {
        DispatchQueue.main.async {
            let errorAlert : UIAlertController = UIAlertController(title: "No result found", message: "Try checking your spelling or use more general terms", preferredStyle: UIAlertController.Style.alert)
            let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { ACTION -> Void in
            }
            errorAlert.addAction(okAction)
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    func showSearchList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(errorModel : ErrorImageViewModel) {
        DispatchQueue.main.async {
            let errorAlert : UIAlertController = UIAlertController(title: errorModel.title, message: errorModel.message, preferredStyle: UIAlertController.Style.alert)
            let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { ACTION -> Void in
            }
            errorAlert.addAction(okAction)
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    /** ActivityIndicatorPresenter mathos to show the indicator*/
    func showLoading() {
        showActivityIndicator()
    }
    
    /** ActivityIndicatorPresenter mathos to hode the indicator*/
    func hideLoading() {
        hideActivityIndicator()
    }
    
}

// MARK: - Extension ImagesSectionControllerDelegate
extension ImagesViewController: ImagesSectionControllerDelegate {
    
    func pushToImageDetailsController(index: Int) {
        self.presenter?.didSelectFor(index: index)
    }
}
