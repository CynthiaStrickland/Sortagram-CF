//
//  API.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/5/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import Photos


typealias ParseCompletionHandler = (sucess: Bool) -> ()

class API {
    
//    class func uploadImage(image: UIImage, completion: ParseCompletionHandler) {
//        
//        if let imageData = UIImageJPEGRepresentation(image, 0.7) {
//            print(imageData)
//            let imageFile = PFFile(name: "image", data: imageData)
//            let status = PFObject(className: "Status")
//            status["image"] = imageFile
//            
//            status.saveInBackgroundWithBlock( { (sucess, error) -> Void in
//                if sucess {
//                    completion(sucess: sucess)
//                } else {
//                    completion(sucess: false)
//                }
//            })
//        }
//    }
//}

//class API {
//    
    class func uploadImages(image: UIImage, text: String) {
        let savedStatus = PFObject(className: kParseCollectionImages)
        
        if let imageData = UIImageJPEGRepresentation(image, 1.0) {
            if let imageFile = PFFile(data: imageData) {
                
                savedStatus ["pictureImage"] = imageFile
                savedStatus ["pictureText"] = text
                savedStatus.saveInBackgroundWithBlock { (success, error) -> Void in
                    
                    if (success) {
                        print(success)
                    } else {
                        print(error)
                    }
                }
            }
        }
    }
//
//    class func fetchObjects(completion: (objects: [Pictures]?) -> ()) {
//    
//    let query = PFQuery(className: kParseImages)
//        query.whereKeyExists("image")
//        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//        if error == nil {
//            if let objects = objects {
//                
//                var arrayOfPictures = [Pictures]()
//                
//                for object in objects {
//                    let pfFileFromObject = object["image"] as! PFFile
//                    let textFromObject = object["pictureText"] as! String
//                    let newStatus = Pictures(pictureImageData: pfFileFromObject, pictureText:textFromObject)
//                    
//                    arrayOfPictures.append(newStatus)
//                }
//                completion(objects: arrayOfPictures)
//            }
//            
//        } else {
//            print(error)
//            
//            }
//        }
//    }
}









