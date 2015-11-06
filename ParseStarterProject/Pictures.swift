//
//  Pictures.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/4/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class Pictures {
    
    var pictureImageData: PFFile
    var pictureImage: UIImage?
    var pictureText: String
    
    init(pictureImageData: PFFile, pictureText: String) {
        self.pictureImageData = pictureImageData
        self.pictureText = pictureText
    }
}

