//
//  GalleryViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/3/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

protocol GalleryViewControllerDelegate {
    
    func galleryViewControllerDidFinish(image: UIImage)

}

class GalleryViewController: UIViewController, UICollectionViewDataSource {
    var delegate: GalleryViewControllerDelegate?
    
    // Watch out for the misspelled collection view!
    @IBOutlet weak var colletionView: UICollectionView!
    
    let myCollectionViewLayout = CollectionLayout()
    
    var posts = [PFObject]() {
        didSet {
            self.colletionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.colletionView.dataSource = self
        
        self.colletionView.collectionViewLayout = myCollectionViewLayout
        
        let query = PFQuery(className: "Status")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let objects = objects {
                self.posts = objects
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(GalleryCollectionViewCell.identifier(), forIndexPath: indexPath) as! GalleryCollectionViewCell
        let post = self.posts[indexPath.row]
        
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
}
//class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
//    
//    var collectionViewPictures = [Status]()
//
//    @IBOutlet weak var galleryCollectionView: UICollectionView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
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
//        API.fetchObjects { (objects) -> Void in
//            if let arrayOfStatuses {
//                self.statuses = arrayOfStatuses
//            }
//    }
//        
//    func fetchObjects(completion: (objects: [Status]?) -> ()) {
//        
//        let query = PFQuery(className: kParseImages)
//        query.whereKeyExists("image")
//        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//            if error == nil {
//                if let objects = objects {
//                    var arrayOfStatuses = [Status]()
//                    for object in objects {
//                        let pfFileFromObject = object["image"] as! PFFile
//                        let textFromObject = object["statusText"] as! String
//                        let newStatus = Status(text: textFromObject, thumbnail: image, image: pfFileFromObject)
//                        
//                        arrayOfStatuses.append(NewStatus)
//                    }
//                    completion(objects: arrayOfStatuses)
//                }
//                
//            } else {
//                
//            }
//        }
//    }
//    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.collectionViewPictures.count
//    }
//
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(GalleryCollectionViewCell.identifier(), forIndexPath: indexPath) as! GalleryCollectionViewCell
//        
//        let picture = self.collectionViewPictures[indexPath.row]
//        cell.picture = picture
//    
//        return cell
//        
//        }
//    }
//
//}
//
//
//
////    func dataSource() {
////
////        for _ in 1...100 {
////            let image = UIImage(named: "atom")
////            let picture = Status(text: "Atom", image: image!)
////            self.collectionViewPictures.append(picture)
////        }
////
////        self.galleryCollectionView.reloadData()
////    }
