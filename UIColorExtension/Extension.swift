
//
//  Extension.swift
//  UIColorExtension
//
//  Created by 李庆彬 on 2/26/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func colorWithRGB(red:Int,green:Int,blue:Int) -> UIColor {
        let color = UIColor.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1);
        return color;
    }

    static func colorWithColorString(colorString:String) -> UIColor {
        
        let range1 = colorString.startIndex.advancedBy(0)..<colorString.startIndex.advancedBy(2)
        let redStr = colorString.substringWithRange(range1);
        let red = self.stringValueToUint(redStr);
        
        let range2 = colorString.startIndex.advancedBy(2)..<colorString.startIndex.advancedBy(4);
        let greenStr = colorString.substringWithRange(range2);
        let green = self.stringValueToUint(greenStr);
        
        let range3 = colorString.startIndex.advancedBy(4)..<colorString.startIndex.advancedBy(6);
        let blueStr = colorString.substringWithRange(range3);
        let blue = self.stringValueToUint(blueStr);
        
        return self.colorWithRGB(Int(red), green: Int(green), blue: Int(blue))
    }
    
    static func stringValueToUint(stringValue:String) -> UInt {
        let value = UnsafeMutablePointer<UInt32>.alloc(0);
        let stringValueScanner = NSScanner(string: stringValue);
        stringValueScanner.scanHexInt(value)
        return UInt(value.memory);
    }
}
