//
//  API.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/6/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

typealias ParseCompletionHandler = (success: Bool) -> ()

class API {
    
    class func uploadImage(image: UIImage, completion: ParseCompletionHandler) {
        
        if let imageData = UIImageJPEGRepresentation(image, 0.7) {
            print(imageData)
            let imageFile = PFFile(name: "image", data: imageData)
            let status = PFObject(className: "CollectionViewData")
            status["image"] = imageFile
            
            status.saveInBackgroundWithBlock( { (success, error) -> Void in
                if success {
                    completion(success: success)
                } else {
                    completion(success: false)
                }
            })
        }
    }
}

