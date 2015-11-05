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

        let gridLayout = self.galleryCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        gridLayout.itemSize = CGSizeMake(100.0, 100.0)
    }

    func dataSource() {
        
        for _ in 1...100 {
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
}


