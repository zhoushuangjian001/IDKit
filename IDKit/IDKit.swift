//
//  IDKit.swift
//  IDKit
//
//  Created by NewWork小贱 on 2019/2/12.
//  Copyright © 2019 NetWork小贱. All rights reserved.
//
//  @ instructions
//
//  IDKit is a class that is applicable to all Swift project development functional requirements. This class provides only functional services, not some UI design. Hope developers choose carefully !!!

import Foundation
import UIKit

// MARK: Software(App) information
struct App {
    
    /// App base information
    static var baseInfo = Bundle.main.infoDictionary
    
    /// App screen width and height
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    
    /// App name
    static var name:String {
        return  App.baseInfo!["CFBundleDisplayName"] as! String
    }
    
    /// App product name
    static var productName:String {
        return App.baseInfo!["CFBundleName"] as! String
    }

    /// App version
    static var version:String {
        return App.baseInfo!["CFBundleShortVersionString"] as! String
    }

    /// App build version
    static var buildVersion:String {
        return App.baseInfo!["CFBundleVersion"] as! String
    }

    /// The App package identifier
    static var bundleIdentifier:String {
        return App.baseInfo!["CFBundleIdentifier"] as! String
    }

    /// The App operation platform
    static var operationPlatform:String {
        return App.baseInfo!["DTPlatformName"] as! String
    }

    /// The App operation platform version
    static var operationPlatformVersion:String {
        return App.baseInfo!["DTPlatformVersion"] as! String
    }

    /// App system version of the minimum support
    static var minimunOSVersion:String {
        return App.baseInfo!["MinimumOSVersion"] as! String
    }
}

// MARK: Numerical transformation
extension SignedNumeric {

    /// Numerical turn String
    var toString:String {
        return "\(self)"
    }

    /// Numerical turn Int
    var toInt:Int {
        var numericalStr = "\(self)"
        if "\(type(of: self))" != "Int"  {
            if numericalStr.contains(".") {
                numericalStr = numericalStr.components(separatedBy: ".").first!
            }
        }
        return Int(numericalStr) ?? 0
    }

    /// Numerical turn Float
    var toFloat:Float {
        return Float("\(self)") ?? 0.0
    }

    /// Numerical turn Double
    var toDouble:Double {
        return Double("\(self)") ?? 0.0
    }
}


// MARK: The view extension(UIView)
extension UIView {

    // MARK: View location size extension
    // Origin x
    var origin_x:CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var origin = self.frame.origin
            origin.x = newValue
            self.frame.origin = origin
        }
    }

    // Origin y
    var origin_y:CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var origin = self.frame.origin
            origin.y = newValue
            self.frame.origin = origin
        }
    }

    // Size width
    var size_width:CGFloat {
        get{
            return self.bounds.width
        }
        set{
            var size = self.bounds.size
            size.width = newValue
            self.bounds.size = size
        }
    }

    // Size height
    var size_height:CGFloat {
        get{
            return self.bounds.height
        }
        set{
            var size = self.bounds.size
            size.height = newValue
            self.bounds.size = size
        }
    }


    // Center x
    var center_x:CGFloat {
        get{
            return self.center.x
        }
        set{
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }

    // Center y
    var center_y:CGFloat {
        get{
            return self.center.y
        }
        set{
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }

    // Origin
    var origin:CGPoint {
        get{
            return self.frame.origin
        }
        set{
            var origin = self.frame.origin
            origin = newValue
            self.frame.origin = origin
        }
    }

    // Size
    var size:CGSize {
        get{
            return self.bounds.size
        }
        set{
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }


    // The four corners vertices of a rectangle
    // Left top vertices
    var ltPoint:CGPoint {
        return self.frame.origin
    }

    // Left botton vertices
    var lbPoint:CGPoint {
        return CGPoint.init(x: self.origin_x, y: self.frame.maxY)
    }

    // Right top vertices
    var rtPoint:CGPoint {
        return CGPoint.init(x: self.frame.maxX, y: self.origin_y)
    }

    // Right botton vertices
    var rbPoint:CGPoint {
        return CGPoint.init(x: self.frame.maxX, y: self.frame.maxY)
    }


    // Translation, scaling, rotation, adaptation
    // The view of translation
    func translationBy(offset:CGPoint){
        var center = self.center
        center.x += offset.x
        center.y += offset.y
        self.center = center
    }

    // The view of Zoom
    func zoomBy(scale:CGFloat){
        var frame = self.frame
        frame.size.width *= scale
        frame.size.height *= scale
        self.frame = frame
    }

    // The view of rotation
    func rotatingBy(angle:CGFloat){
        let transform = CGAffineTransform.init(rotationAngle: angle)
        self.transform = transform
    }

    // The view Adaptive size specification
    func sizeFitBy(size:CGSize) {
        var frame = self.frame
        let aspectRatio = frame.width / frame.height
        if size.width > size.height {
            frame.size.height = size.height
            frame.size.width = size.height * aspectRatio
        }
        if size.width < size.height {
            frame.size.width = size.width
            frame.size.height = size.width / aspectRatio
        }
        if size.width == size.height {
            frame.size.height = size.height
            frame.size.width = size.height * aspectRatio
        }
        self.frame = frame
    }
}


// MARK: The expansion of the string (String)
extension String {

    // The length of characters in a string
    var length:Int {
        return self.count
    }

    // Turn the string value
    // String to Int
    var toInt:Int {
        // The old way
        var array = [String]()
        for i in 0...9 {
            array.append("\(i)")
        }
        array.append(".")
        //
        var pointCount:Int = 0
        var isNumber = true
        // Traversal string
        for i in self {
            let temp = "\(i)"
            if array.contains(temp) {
                if temp == "." {
                    pointCount += 1
                }
            }else{
                isNumber = false
                break
            }
        }
        if pointCount > 1 || isNumber == false {
            return 0
        }else{
            return Int(self)!
        }
    }

    // String to Float
    var toFloat:Float {
        // r取点 ，去空
        return Float(self)!
    }
    

}
