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
import CommonCrypto
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
    
    /// Navigation Offset Height(This is not the actual height of navigation, the actual height of 44.)
    static var navigationHeight:CGFloat {
        return UIScreen.main.bounds.height > 800 ? 88:64
    }
    
    /// TabBar Height
    static var tabBarHeight:CGFloat {
        return UIScreen.main.bounds.height > 800 ? 83:49
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

    /// MARK: View location size extension
    /// Origin x
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

    /// Origin y
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

    /// Size width
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

    /// Size height
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


    /// Center x
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

    /// Center y
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

    /// Origin
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

    /// Size
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


    /// The four corners vertices of a rectangle
    /// Left top vertices
    var ltPoint:CGPoint {
        return self.frame.origin
    }

    /// Left botton vertices
    var lbPoint:CGPoint {
        return CGPoint.init(x: self.origin_x, y: self.frame.maxY)
    }

    /// Right top vertices
    var rtPoint:CGPoint {
        return CGPoint.init(x: self.frame.maxX, y: self.origin_y)
    }

    /// Right botton vertices
    var rbPoint:CGPoint {
        return CGPoint.init(x: self.frame.maxX, y: self.frame.maxY)
    }


    /// Translation, scaling, rotation, adaptation
    /// The view of translation
    func translationBy(offset:CGPoint){
        var center = self.center
        center.x += offset.x
        center.y += offset.y
        self.center = center
    }

    /// The view of Zoom
    func zoomBy(scale:CGFloat){
        var frame = self.frame
        frame.size.width *= scale
        frame.size.height *= scale
        self.frame = frame
    }

    /// The view of rotation
    func rotatingBy(angle:CGFloat){
        let transform = CGAffineTransform.init(rotationAngle: angle)
        self.transform = transform
    }

    /// The view Adaptive size specification
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

    /// The length of characters in a string
    var length:Int {
        return self.count
    }

    /// Type conversion
    /// String to Int
    var toInt:Int {
        var result:Int = 0
        var tempSelf = self
        var carryValue:Int = 0
        let isPoint = self.hasPrefix(".") || self.hasSuffix(".")
        if !isPoint {
            var anyArray = [String]()
            var numberArray = [String]()
            for i in  0...9 {
                numberArray.append("\(i)")
            }
            anyArray = numberArray
            anyArray.append(".")
            if self.contains(".") {
                tempSelf = self.components(separatedBy: ".").first!
                let firstCharts = self.components(separatedBy: ".").last!.first!
                if numberArray.contains("\(firstCharts)") {
                    if Int("\(firstCharts)")! > 4 {
                        carryValue = 1
                    }
                }
            }
            for item in tempSelf {
                let temp = "\(item)"
                if anyArray.contains(temp){
                    result = Int(tempSelf)!
                }
            }
        }
        return result + carryValue
    }

    /// String to float
    var toFloat:Float {
        return Float(self)!
    }

    /// String to double
    var toDouble:Double {
        return Double(self)!
    }

    /// Color hexadecimal conversion
    var toColor:UIColor {
        return self.getColor(value: self)
    }

    /// P3 color value
    var toP3Color:UIColor {
        return self.getColor(value: self,type: false)
    }

    /// For color object function
    ///
    /// - Parameters:
    ///   - value: Color value
    ///   - type: Standard 、P3
    /// - Returns: Color object
    fileprivate func getColor(value:String,type:Bool = true)-> UIColor {
        var tempself = value.replacingOccurrences(of: " ", with: "")
        if self.hasPrefix("#") {
            let index = self.index(startIndex, offsetBy: 1)
            tempself = String(self[index ..< endIndex])
        }
        if tempself.count == 6 {
            var anyArray = [String]()
            for i in 0 ... 9 {
                anyArray.append("\(i)")
            }
            anyArray.append(contentsOf: ["A", "B", "C", "D", "E", "F", "a", "b", "c", "d", "e", "f"])
            for item in tempself {
                let temp = "\(item)"
                if !anyArray.contains(temp) {
                    return UIColor.clear
                }
            }
            var numAcceptContainer = [UInt32](repeating: 0, count: 3)
            for i in 0 ..< 3 {
                let sIndex = tempself.index(tempself.startIndex, offsetBy: 2)
                let tempStr = String(tempself[tempself.startIndex ..< sIndex])
                tempself = String(tempself[sIndex ..< tempself.endIndex])
                Scanner.init(string: tempStr).scanHexInt32(&numAcceptContainer[i])
            }
            if !type {
                if #available(iOS 10.0, *) {
                    return  UIColor.init(displayP3Red: CGFloat(numAcceptContainer[0])/255.0, green: CGFloat(numAcceptContainer[1])/255.0, blue: CGFloat(numAcceptContainer[2])/255.0, alpha: 1.0)
                }
            }
            return UIColor.init(red: CGFloat(numAcceptContainer[0])/255.0, green: CGFloat(numAcceptContainer[1])/255.0, blue: CGFloat(numAcceptContainer[2])/255.0, alpha: 1.0)
        }
        return UIColor.clear
    }

    /// The slice of the string
    func sliceRange(_ start: Int = 0, _ length: Int = 0)-> String {
        let tempself = self.replacingOccurrences(of: " ", with: "")
        guard tempself.count != 0 else { return self}
        let sLength = tempself.count
        var index = start
        var endIndex = length
        if index < 0 || index >= sLength {
            index = 0
        }
        if sLength - index <= endIndex || endIndex == 0 {
            endIndex = sLength - index
        }
        let s_index = tempself.index(startIndex, offsetBy: index)
        let e_index = tempself.index(startIndex, offsetBy: index + endIndex)
        return String(tempself[s_index ..< e_index])
    }
    
    /// Add thousands
    var thousands:String {
        guard self.count != 0  else {return self}
        var tempself = self.replacingOccurrences(of: " ", with: "")
        var decimalPart:String = ""
        if tempself.contains(".") {
            let separateArray = tempself.components(separatedBy: ".")
            tempself = separateArray.first!
            decimalPart = separateArray.last!
        }
        var tempArray = [String]()
        let reversedArray:[Character] = tempself.reversed()
        for i in 0 ..< reversedArray.count {
            let temp = reversedArray[i]
            tempArray.append("\(temp)")
            if (i + 1)%3 == 0 , i != reversedArray.count - 1 {
                tempArray.append(",")
            }
        }
        tempArray = tempArray.reversed()
        let result = tempArray.joined(separator: "")
        return result + (decimalPart.count == 0 ? decimalPart: "." + decimalPart)
    }
    
    /// String encryption
    /// MD5
    enum EncryptionStringType {
        case capital
        case lowercase
    }
    
    /// 32-bit md5 encryption
    ///
    /// - Parameter outputType: Encrypt string output type
    /// - Returns: Encrypted string
    func md5_32bit(outputType:EncryptionStringType = .capital) ->String {
        guard self.count != 0 else { return self }
        let cInput = self.cString(using: .utf8)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(cInput, CC_LONG(strlen(cInput!)), result)
        var md5String = ""
        var opType = "%02X"
        if outputType == .lowercase {
            opType = "%02x"
        }
        for i in 0 ..< CC_MD5_DIGEST_LENGTH {
            let tempStr = String.init(format: opType, result[Int(i)])
            md5String += tempStr
        }
        return md5String
    }
    
    
    /// 16-bit md5 encryption
    ///
    /// - Parameter outputType: Encrypt string output type
    /// - Returns: Encrypted string
    func md5_16bit(outputType:EncryptionStringType = .capital) -> String {
        guard self.count != 0 else {return self}
        var md5String = self.md5_16bit(outputType: outputType)
        md5String = self.sliceRange(8, 16)
        return md5String
    }
    
    /// Privacy cover
    enum KindType {
        case bankCard
        case iphoneNumber
        case idCard
    }
    
    /// Private information hiding
    ///
    /// - Parameters:
    ///   - coverBody: The cover body
    ///   - type: Type to cover
    /// - Returns: The result of covering
    func coverPrivacy(coverBody:String = "*", type:KindType = .bankCard ) -> String {
        guard self.count != 0 else {return self}
        let tempself = self.replacingOccurrences(of: " ", with: "")
        var resultStr = ""
        var sIndex:String.Index?
        var eIndex:String.Index?
        var headPart = ""
        var footPart = ""
        if type == .bankCard {
            guard tempself.count == 16 else {return self}
            sIndex = tempself.index(startIndex, offsetBy: tempself.count - 4)
            footPart = String(tempself[sIndex! ..< tempself.endIndex])
            for i in 1 ... tempself.count - 4 {
                var cBody = ""
                if i % 4 == 0 {
                    cBody = " "
                }
                resultStr += coverBody + cBody
            }
        }
        
        if type == .iphoneNumber {
            guard tempself.count == 11 else {return self}
            eIndex = tempself.index(startIndex, offsetBy: 2)
            headPart = String(tempself[startIndex ..< eIndex!])
            sIndex = tempself.index(startIndex, offsetBy: tempself.count - 3)
            footPart = String(tempself[sIndex! ..< tempself.endIndex])
            for i in 1 ... 6 {
                var cBody = ""
                if i == 1 || i == 5 {
                    cBody = " "
                }
                resultStr += coverBody + cBody
            }
        }
        
        if type == .idCard {
            guard tempself.count == 18 else {return self}
            eIndex = tempself.index(startIndex, offsetBy: 3)
            headPart = String(tempself[startIndex ..< eIndex!])
            sIndex = tempself.index(startIndex, offsetBy: tempself.count - 3)
            footPart = String(tempself[sIndex! ..< tempself.endIndex])
            for i in 1 ... 12 {
                var cBody = ""
                if i == 3 || i == 7 || i == 11 {
                    cBody = " "
                }
                resultStr += coverBody + cBody
            }
        }
        return headPart + resultStr + footPart
    }
    
    /// Specifies the kind of private information masking that is the default masking
    ///
    /// - Parameter type: Cover type
    /// - Returns: The result of covering
    func coverPrivacy(type:KindType = .bankCard) -> String {
        return self.coverPrivacy(coverBody: "*", type: type)
    }
    
    /// A regular event
    var isPhoneNumber:Bool {
        
        return false
    }

}

// MARK: Mobile Device Extension
struct Device {
    
    /// Device object
    fileprivate static var device = UIDevice.current
    
    /// Name of device
    static var name:String {
        var suffix:String = "simulator"
        let size = UIScreen.main.bounds.size
        if size.equalTo(CGSize.init(width: 320, height: 568)) {
            suffix = "5s/SE"
        }
        if size.equalTo(CGSize.init(width: 375, height: 667)) {
            suffix = "6/6s/7/8"
        }
        if size.equalTo(CGSize.init(width: 414, height: 763)) {
            suffix = "6 Plus/6s Plus/7 Plus/8 Plus"
        }
        if size.equalTo(CGSize.init(width: 375, height: 812)) {
            suffix = "X/XS"
        }
        if size.equalTo(CGSize.init(width: 414, height: 896)) {
            suffix = "XR/XS Max"
        }
        return "iphone - " + suffix
    }
    
    /// A UUID that may be used to uniquely identify the device, same across apps from a single vendor
    static var uuid:String {
        return device.identifierForVendor!.uuidString
    }
    
    /// Device nick name
    static var nickName:String {
        return device.name
    }
    
    /// Device system name
    static var systemName:String {
        return device.systemName
    }
    
    /// Device system version
    static var systemVersion:String {
        return device.systemVersion
    }
    
    /// Get battery power
    static var batterLevel:Float {
        return device.batteryLevel
    }
    
    /// Device model (iphone、iPad)
    static var model:String {
        return device.model
    }
    
}


// MARK: - The expansion of the tuple

