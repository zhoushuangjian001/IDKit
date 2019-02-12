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
        return  App.baseInfo!["CFBundleName"] as! String
    }
    
    /// App product name
    static var productName:String {
        return App.baseInfo!["CFBundleExecutable"] as! String
    }
}
