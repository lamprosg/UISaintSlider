//
//  UIImage+OverlayColor.swift
//  UISaintSlider
//
//  Created by Lampros Giampouras on 05/01/2019.
//  Copyright © 2019 Lampros Giampouras. All rights reserved.
//

import UIKit

extension UIImage {
    
    /**
     Adds an overlay color on the UIImage
     
     - parameter color: The UIColor to be added
     
     - returns: The colored UImage
     */
    public func withOverlayColor(_ color:UIColor) -> UIImage {
        
        var imageScale:CGFloat = 1.0
        
        if self.responds(to: #selector(NSDecimalNumberBehaviors.scale)) {
            imageScale = self.scale
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, imageScale)
        let context = UIGraphicsGetCurrentContext()
        
        // flip the image
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.translateBy(x: 0.0, y: -self.size.height)
        
        // multiply blend mode
        context?.setBlendMode(CGBlendMode.multiply)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context?.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context?.fill(rect)
        
        // create uiimage
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
