//
//  ImageDetailViewController.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 15/07/21.
//

/**View controller Used to show a full-page version of the image */
import UIKit

class ImageDetailViewController: UIViewController {

    var imageDetails:ImageData?
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Image Detail"
        // Do any additional setup after loading the view.
        if let imgObject = imageDetails, let imageUrl = URL(string: imgObject.thumbnail?.source ?? "") {
            self.imageView.setImage(url: imageUrl)
        }
    }

}
