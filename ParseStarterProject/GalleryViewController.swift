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
    
    var collectionViewPictures = [Pictures]()

    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
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
        API.fetchObjects { (objects) -> in
            if let arrayOfStatuses {
                self.statuses = arrayOfStatuses
                
            }
    
    }
        
    class func fetchObjects(completion: (objects: [Status]?) -> ()) {
        
        let query = PFQuery(className: kParseClass)
        query.whereKeyExtists("image")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                if let objects = objects {
                    var arrayOfStatuses = [Status]()
                    for object in objects {
                        let pfFileFromObject = object["image"] as! PFFile
                        let textFromObject = object["statusText"] as! String
                        let newStatus = Status(statusText: textFromObject, statusImageData: pfFileFromObject)
                        
                        arrayOfStatuses.append(NewStatus)
                    }
                    completeion(objects: arrayOfStatuses)
                }
                
            } else {
                
            }
        }
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

}
