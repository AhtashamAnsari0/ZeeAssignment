//
//  ImageCell.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

/**UICollectionView Cell Used to display the images in a grid*/
import UIKit

class ImageCell: UICollectionViewCell {
    
    /**UIImageView Used to  display grid image*/
    @IBOutlet weak var imageView: UIImageView!
    
    /** Custom Mathod used to configure the cell*/
    func configureCell(with object:ImageData?) {
        if let imgObject = object?.thumbnail, let imageUrl = URL(string: imgObject.source ?? "") {
            if imgObject.width ?? 0 > imgObject.height ?? 0 {
                self.imageView.contentMode = .scaleAspectFit
            } else {
                imageView.contentMode = .scaleAspectFill
            }
            self.imageView.setImage(url: imageUrl)
        }
    }
}
