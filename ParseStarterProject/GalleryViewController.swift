//
//  GalleryViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/3/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var galleryCollectionView: UICollectionView!

    var gallery = [PFObject]() {
        didSet {
            self.galleryCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func queryForCollectionView() -> PFQuery {
        
        let query = PFQuery(className: "CollectionViewData")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if let objects = objects {
            self.gallery = objects
            }
        }
        
        return query
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gallery.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(GalleryCollectionViewCell.identifier(), forIndexPath: indexPath) as!GalleryCollectionViewCell
        let post = self.gallery[indexPath.row]
        
        if let imageFile = post["image"] as? PFFile {
            imageFile.getDataInBackgroundWithBlock({ (data, error) -> Void in
                if let data = data {
                    let image = UIImage(data: data)
                    cell.imageView.image = image
                }
            })
        }
        
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








//    var picture = [Pictures]() {
//        didSet {
//            self.galleryCollectionView.reloadData()
//    }
//}
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.dataSource()
//
//        let collectionLayout = self.galleryCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        
//        collectionLayout.itemSize = CGSizeMake(100.0, 100.0)
//    }
//    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(true)
//        fetchStatuses()
//    }
//    
//    func fetchStatuses() {
//        API.fetchObjects { (objects) -> () in
//            if let arrayOfPictures = objects {
//                self.picture = arrayOfPictures
//
//            }
//            
//        }
//    
//    }
//    
//   func dataSource() {
////        
////        for _ in 1...100 {
////            let image = UIImage(named: "atom")
////            let picture = Pictures(pictureImageData: image, pictureText: "Atom")
////            self.galleryCollectionView.append(picture)
////        }
//    
//        self.galleryCollectionView.reloadData()
//    }
//    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return picture.count
//    }
//
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(GalleryCollectionViewCell.identifier(), forIndexPath: indexPath) as! GalleryCollectionViewCell
//        
//        cell.statusForTimeLine = galleryCollectionView[indexPath.row]
//        
////        let picture = self.picture[indexPath.row]
////        cell.picture = picture
////    
//        return cell
//        
//        }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//        let collectionViewWidth = CGRectGetWidth(self.view.frame)
//        let width = (collectionViewWidth / 2.0) - 0.5
//        
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSizeMake(width, width)
//        layout.minimumLineSpacing = 1.0
//        layout.minimumInteritemSpacing = 1.0
//        
//        return layout.itemSize
//            
//        }
//    }


