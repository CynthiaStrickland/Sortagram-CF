//
// Status.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/4/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class Status {
    
    let image: UIImage
    let thumbnail: UIImage
    let text: String
    
    init(text: String, thumbnail: UIImage, image: UIImage) {
        self.text = text
        self.thumbnail = image
        self.image = image
    }
}

