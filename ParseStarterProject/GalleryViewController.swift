//
//  GalleryViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/3/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class GalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var datasource = [Status]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func generateData() {
        for _ in 1...100 {
            let image = UIImage(named: "atom")!
            let post = Status(text: "Atom", thumbnail: image, image: image)
            self.datasource.append(post)
        }
        
        self.collectionView.reloadData()
        
    }
    
    // MARK: UICollectionView
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(GalleryCollectionViewCell.identifier(), forIndexPath: indexPath) as! GalleryCollectionViewCell
        
        
        let post = self.datasource[indexPath.row]
        cell.post = post
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(100.0, 100.0)
        
    }
}




//protocol GalleryViewControllerDelegate {
//
//    func galleryViewControllerDidFinish(image: UIImage)
//
//}
//
//class GalleryViewController: UIViewController, UICollectionViewDataSource {
//    var delegate: GalleryViewControllerDelegate?
//
//    // Watch out for the misspelled collection view!
//    @IBOutlet weak var colletionView: UICollectionView!
//
//    let myCollectionViewLayout = CollectionLayout()
//
//    var posts = [PFObject]() {
//        didSet {
//            self.colletionView.reloadData()
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        self.colletionView.dataSource = self
//
//        self.colletionView.collectionViewLayout = myCollectionViewLayout
//
//        let query = PFQuery(className: "Status")
//
//        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//            if let objects = objects {
//                self.posts = objects
//            }
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//
//    }
//
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.posts.count
//    }
//
//
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(GalleryCollectionViewCell.identifier(), forIndexPath: indexPath) as! GalleryCollectionViewCell
//        let post = self.posts[indexPath.row]
//
//        if let imageFile = post["image"] as? PFFile {
//            imageFile.getDataInBackgroundWithBlock({ (data, error) -> Void in
//                if let data = data {
//                    let image = UIImage(data: data)
//                    cell.imageView.image = image
//                }
//            })
//        }
//
//        return cell
//    }
//}
