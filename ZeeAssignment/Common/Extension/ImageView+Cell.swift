//
//  ImageView+Cell.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 15/07/21.
//


import UIKit
import AlamofireImage

extension UIImageView {
    func setImage(url: URL) {
        self.af.setImage(withURL: url, imageTransition: .crossDissolve(0.1))
    }
}
