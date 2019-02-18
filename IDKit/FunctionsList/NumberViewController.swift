//
//  NumberViewController.swift
//  IDKit
//
//  Created by 周双建 on 2019/2/18.
//  Copyright © 2019 NetWork小贱. All rights reserved.
//

import UIKit

class NumberViewController: UIViewController {

    @IBOutlet weak var I_to_F_lable: UILabel!
    @IBOutlet weak var I_to_D_lable: UILabel!
    @IBOutlet weak var I_to_S_lable: UILabel!
    @IBOutlet weak var F_to_I_lable: UILabel!
    @IBOutlet weak var F_to_D_lable: UILabel!
    @IBOutlet weak var F_to_S_lable: UILabel!
    @IBOutlet weak var D_to_I_lable: UILabel!
    @IBOutlet weak var D_to_F_lable: UILabel!
    @IBOutlet weak var D_to_S_lable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValueForLables()
        // Do any additional setup after loading the view.
    }

    // 数值赋值
    func setValueForLables(){

        // Int 类型
        let iF:Int = 10
        I_to_F_lable.text = "10 => " + "\(iF.toFloat)" + "  |  " + "类型是:" + "\(type(of: iF.toFloat))"
        I_to_D_lable.text = "10 => " + "\(iF.toDouble)" + "  |  " + "类型是:" + "\(type(of: iF.toDouble))"
        I_to_S_lable.text = "10 => " + "\(iF.toString)" + "  |  " + "类型是:" + "\(type(of: iF.toString))"

        // Float
        let fI:Float = 10.45
        F_to_I_lable.text = "10.45 => " + "\(fI.toInt)" + "  |  " + "类型是:" + "\(type(of: fI.toInt))"
        F_to_D_lable.text = "10.45 => " + "\(iF.toDouble)" + "  |  " + "类型是:" + "\(type(of: iF.toDouble))"
        F_to_S_lable.text = "10.45 => " + "\(iF.toString)" + "  |  " + "类型是:" + "\(type(of: iF.toString))"

        // Double
        let dI:Double = 10.456
        D_to_I_lable.text = "\(dI) => " + "\(dI.toInt)" + "  |  " + "类型是:" + "\(type(of: dI.toInt))"
        D_to_F_lable.text = "\(dI) => " + "\(dI.toFloat)" + "  |  " + "类型是:" + "\(type(of: dI.toFloat))"
        D_to_S_lable.text = "\(dI) => " + "\(dI.toString)" + "  |  " + "类型是:" + "\(type(of: dI.toString))"


    }

}
