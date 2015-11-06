//
//  GalleryCollectionViewCell.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/3/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var post: Status? {
        didSet {
            if let post = self.post {
                self.imageView.image = post.image
            }
        }
    }
    class func identifier() -> String {
        return "GalleryCollectionViewCell"
    }
    
    
}
