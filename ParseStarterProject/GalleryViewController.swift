//
//  GalleryViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/3/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var collectionViewPictures = [Pictures]()

    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource()

    }

    func dataSource() {
        
        for _ in 1...10 {
            let image = UIImage(named: "atom")
            let picture = Pictures(text: "Atom", image: image!)
            self.collectionViewPictures.append(picture)
        }
        
        self.galleryCollectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionViewPictures.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(GalleryCollectionViewCell.identifier(), forIndexPath: indexPath) as! GalleryCollectionViewCell
        
        let picture = self.collectionViewPictures[indexPath.row]
        cell.picture = picture
    
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


