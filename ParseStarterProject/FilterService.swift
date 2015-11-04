//
//  FilterService.swift
//  ParseStarterProject-Swift
//
//  Created by Cynthia Whitlatch on 11/3/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import CoreImage

class FilterService {
    
    private class func setupFilter(filterName: String, parameters: [String: AnyObject]?, image: UIImage) -> UIImage?{
        
        //change image to CIImage
        let image = CIImage(image: image)
        let filter : CIFilter   //create filter
        
        //are there parameters?
        if let parameters = parameters {
            filter = CIFilter(name: filterName, withInputParameters: parameters)!
        } else {
            filter = CIFilter(name: filterName)!
        }
        filter.setValue(image, forKey:kCIInputImageKey)   //input image for filter
     
        // GPU CONTEXT - BoilerPlate Language
        let options = [kCIContextWorkingColorSpace: NSNull()]
        let myEAGLContext = EAGLContext(API:EAGLRenderingAPI.OpenGLES2)
        let gpuContext = CIContext(EAGLContext: myEAGLContext, options: options)
        
        //image comes back from filter ...make it the same size as the original image "extent"
        let outputImage = filter.outputImage
        let extent = outputImage!.extent
        let cgImage = gpuContext.createCGImage(outputImage!, fromRect: extent)
        
        
        let finalImage = UIImage(CGImage: cgImage)
        
        return finalImage
    }
    
    //ACTUAL FILTERS
    
    class func applyVintageEffect(image: UIImage, completion: (filteredImage: UIImage?, name: String) -> Void) {
        
        let filterName = "CIPhotoEffectTransfer"
        let displayName = "Vintage"
        
        //call method for filter
        let finalImage = self.setupFilter(filterName, parameters: nil, image: image)
    
                //make sure you are handling the threading yourself -   ???
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            completion(filteredImage: finalImage, name: displayName)

        }
    }
    
    class func applyBWEffect(image: UIImage, completion: (filteredImage: UIImage?, name: String) -> Void) {
        
        let filterName = "CIPhotoEffectMono"
        let displayName = "Black and White"
        
        //call method for filter
        let finalImage = self.setupFilter(filterName, parameters: nil, image: image)
        
        //make sure you are handling the threading yourself -   ???
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            completion(filteredImage: finalImage, name: displayName)
        }
    }
    
    class func applyChrome(image: UIImage, completion: (filteredImage: UIImage?, name: String) -> Void) {
        
        let filterName = "CIPhotoEffectChrome"
        let displayName = "Chrome"
        
        //call method for filter
        let finalImage = self.setupFilter(filterName, parameters: nil, image: image)
        
        //make sure you are handling the threading yourself -   ???
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            completion(filteredImage: finalImage, name: displayName)
        }
    }
    
    class func CIColorCrossPolynomial(image: UIImage, completion: (filteredImage: UIImage?, name: String) -> Void) {
        
//        var color_polynomial = new CIColorPolynomial () {
//            Image = flower,
//            RedCoefficients = new CIVector (0, 0, 0, .4f),
//            GreenCoefficients = new CIVector (0, 0, .5f, .8f),
//            BlueCoefficients = new CIVector (0, 0, .5f, 1),
//            AlphaCoefficients = new CIVector (0, 1, 1, 1),
//        };
        
//        return color_polynomial.OutputImage;
//    }
        
        let filterName = "CIColorCrossPolynomial"
        let displayName = "Color Cross"
        
        //call method for filter
        let finalImage = self.setupFilter(filterName, parameters: nil, image: image)
        
        //make sure you are handling the threading yourself -   ???
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            completion(filteredImage: finalImage, name: displayName)
        }
    }
}


