//
//  ImagesSectionController.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

/**List SectionController Used to display the images in a grid*/
import UIKit
import IGListKit

protocol ImagesSectionControllerDelegate: AnyObject {
    func pushToImageDetailsController(index: Int)
}

class ImagesSectionController: ListSectionController {
    /** Thumbnail object used for display the image*/
    private var object: ImageData?
    /** delegate  object used for communicate with view controller*/
    weak var delegate: ImagesSectionControllerDelegate?
    
    // MARK: - UICollectionView DataSource Delegate mathod
    override func sizeForItem(at index: Int) -> CGSize {
        CGSize(width: object?.thumbnail?.width ?? 0, height: object?.thumbnail?.height ?? 0)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell: ImageCell = collectionContext?.dequeueReusableCellFromStoryboard(
            withIdentifier: Constants.CellIdentifiers.imageCell,
            for: self,
                at: index) as? ImageCell else {return UICollectionViewCell()}
        
        cell.configureCell(with: object)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? ImageData
    }
    
    override func didSelectItem(at index: Int) {
        delegate?.pushToImageDetailsController(index: section)
    }
    
}
