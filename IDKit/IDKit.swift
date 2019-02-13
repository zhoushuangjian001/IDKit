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



