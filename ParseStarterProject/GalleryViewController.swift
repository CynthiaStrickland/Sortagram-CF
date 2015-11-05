//
//  GalleryViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/3/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    

    var picture = [Pictures]() {
        didSet {
            self.galleryCollectionView.reloadData()
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource()

        let collectionLayout = self.galleryCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        collectionLayout.itemSize = CGSizeMake(100.0, 100.0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        fetchStatuses()
    }
    
    func fetchStatuses() {
        API.fetchObjects { (objects) -> () in
            if let arrayOfPictures = objects {
                self.picture = arrayOfPictures

            }
            
        }
    
    }
    
   func dataSource() {
//        
//        for _ in 1...100 {
//            let image = UIImage(named: "atom")
//            let picture = Pictures(pictureImageData: image, pictureText: "Atom")
//            self.galleryCollectionView.append(picture)
//        }
    
        self.galleryCollectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryCollectionView.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(GalleryCollectionViewCell.identifier(), forIndexPath: indexPath) as! GalleryCollectionViewCell
        
        cell.statusForTimeLine = galleryCollectionView[indexPath.row]
        
//        let picture = self.collectionViewPictures[indexPath.row]
//        cell.picture = picture
//    
        return cell
        
        }
    
    

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let collectionViewWidth = CGRectGetWidth(self.view.frame)
        let width = (collectionViewWidth / 2.0) - 0.5
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        
        return layout.itemSize
            
        }
    }


