//
//  GalleryViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/3/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Photos

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    var albumName: String!
    var assetsCollection: PHAssetCollection!
    var photoAssets: PHFetchResult!

    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoAssets.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: AlbumsCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! AlbumsCollectionViewCell
        
        let asset: PHAsset = photoAssets[indexPath.row] as! PHAsset
        
        PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.AspectFit, options: nil) { (image: UIImage?, object: [NSObject: AnyObject]?) -> Void in
            
            cell.imageView.image = image
            
        }
        return cell
        
    }
    
    
    // Mark:  Collection View Layout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let width = self.view.frame.width
        let sizeDimension = (width - 2 * 3) / 4
        
        return CGSizeMake(sizeDimension, sizeDimension)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }


}
