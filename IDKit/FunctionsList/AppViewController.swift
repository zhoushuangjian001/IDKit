//
//  AppViewController.swift
//  IDKit
//
//  Created by NewWork小贱 on 2019/2/12.
//  Copyright © 2019 NetWork小贱. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {

    
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var widthLable: UILabel!
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var productNameLable: UILabel!
    
    @IBOutlet weak var versionLable: UILabel!
    @IBOutlet weak var buildVersionLable: UILabel!


    @IBOutlet weak var identifierLable: UILabel!

    @IBOutlet weak var minimumOSVersionLable: UILabel!

    @IBOutlet weak var platformNameLable: UILabel!
    @IBOutlet weak var platformVersionLable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAppScreenWidthOrHeight()
        self.setNamesOfApp()
        self.setVersionOfApp()
        self.setPackageIdentifier()
        self.setPlatformInfo()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension AppViewController {
    // 宽与高
    func setAppScreenWidthOrHeight() {
        widthLable.text = "宽:  " + "\(App.width)" + " pt"
        heightLable.text = "高:  " + "\(App.height)" + " pt"
    }
    
    
    // 名字
    func setNamesOfApp(){
        nameLable.text = "名字:  " + "\(App.name)"
        productNameLable.text = "工程名:  " + "\(App.productName)"
    }

    // 版本
    func setVersionOfApp(){
        versionLable.text = "版本:  " + "\(App.version)"
        buildVersionLable.text = "内部版本:  " + "\(App.buildVersion)"
    }

    // 包标识符
    func setPackageIdentifier(){
        identifierLable.text = "包标识符:  " + "\(App.bundleIdentifier)"
    }

    // 支持运行的最小系统版本、运行平台名字、运行平台的系统版本
    func setPlatformInfo(){
        minimumOSVersionLable.text = "支持最小运行系统版本:  " + "\(App.minimunOSVersion)"
        platformNameLable.text =   "运行平台名字: " + "\(App.operationPlatform)"
        platformVersionLable.text = "运行平台的系统版本: " + "\(App.operationPlatformVersion)"
    }
}
