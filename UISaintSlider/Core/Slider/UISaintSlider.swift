//
//  UISaintSlider.swift
//  UISaintSlider
//
//  Created by Lampros Giampouras on 05/01/2019.
//  Copyright © 2019 Lampros Giampouras. All rights reserved.
//

import UIKit

class UISaintSlider: UISlider {

    let dotDiameter:CGFloat = 10
    let dotSaintSizeMultiplier:CGFloat = 3
    
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        let unadjustedThumbrect = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
        let thumbOffsetToApplyOnEachSide:CGFloat = unadjustedThumbrect.size.width - (dotSaintSizeMultiplier*dotDiameter/2 + dotDiameter/2)
        let minOffsetToAdd = -thumbOffsetToApplyOnEachSide
        let maxOffsetToAdd = thumbOffsetToApplyOnEachSide
        let offsetForValue = minOffsetToAdd + (maxOffsetToAdd - minOffsetToAdd) * CGFloat(value / (self.maximumValue - self.minimumValue))
        var origin = unadjustedThumbrect.origin
        origin.x += offsetForValue
        return CGRect(origin: origin, size: unadjustedThumbrect.size)
    }
    
    func createThumbImage() -> UIImage? {
        
        let thumbView = UIView()
        thumbView.frame = CGRect(x: 0, y: 0, width: dotSaintSizeMultiplier*dotDiameter, height: dotSaintSizeMultiplier*dotDiameter)
        
        let saintShapeLayer = CAShapeLayer()
        saintShapeLayer.path = UIBezierPath(ovalIn: thumbView.frame).cgPath
        saintShapeLayer.backgroundColor = UIColor.clear.cgColor
        saintShapeLayer.fillColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        saintShapeLayer.strokeColor = UIColor.clear.cgColor
        saintShapeLayer.frame = thumbView.frame
        saintShapeLayer.position = thumbView.center
        thumbView.layer.addSublayer(saintShapeLayer)
        
        let dotFrame = CGRect(x: 0, y: 0, width: dotDiameter, height: dotDiameter)
        
        let dotViewLayer = CAShapeLayer()
        dotViewLayer.path = UIBezierPath(ovalIn: dotFrame).cgPath
        dotViewLayer.backgroundColor = UIColor.clear.cgColor
        dotViewLayer.fillColor = UIColor.gray.withAlphaComponent(1.0).cgColor
        dotViewLayer.strokeColor = UIColor.clear.cgColor
        dotViewLayer.frame = dotFrame
        dotViewLayer.position = thumbView.center
        thumbView.layer.addSublayer(dotViewLayer)
        
        return self.imageFromLayer(thumbView.layer)
    }
    
    private func imageFromLayer(_ layer: CALayer) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0.0)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage?.withOverlayColor(self.tintColor)
    }
}
