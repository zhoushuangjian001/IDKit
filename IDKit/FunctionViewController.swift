//
//  FunctionViewController.swift
//  IDKit
//
//  Created by NewWork小贱 on 2019/2/12.
//  Copyright © 2019 NetWork小贱. All rights reserved.
//

import UIKit

class FunctionViewController: UIViewController {
    
    // Data containers
    var funcDataContainers = [Dictionary<String,AnyObject>]()
    // Data list containers
    var funcListDataContainers = Array<String>()

    @IBOutlet weak var funcListCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerComponentOfCollectionView()
        self.getListData()

        let s = "120.23.26".toFloat
        print(s)
        
    }
    
    // TODO: Registered Component Of CollectionView
    func registerComponentOfCollectionView(){
        funcListCollectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "com.network.idkit")
    }
    // TODO: Get Data
    func getListData() {
        let dataPath = Bundle.main.path(forResource: "FuncList", ofType: "json")
        let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: dataPath!), options: .alwaysMapped)
        if data != nil {
            let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            if json != nil {
                funcDataContainers = json as! [Dictionary<String,AnyObject>]
                funcListCollectionView.reloadData()
            }
        }
    }
}

// MARK: Collection Delegate
extension FunctionViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    // Section number
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return funcDataContainers.count
    }
    
    // Cell number
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        funcListDataContainers = funcDataContainers[section]["list"] as! Array<String>
        return funcListDataContainers.count
    }
    
    // Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "com.network.idkit", for: indexPath) as! CollectionViewCell
        funcListDataContainers = funcDataContainers[indexPath.section]["list"] as! Array<String>
        let title = funcListDataContainers[indexPath.row]
        cell.titleLable.text = title
        
        return cell
    }
    
    // Cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width - 20, height: 50)
    }
    
    // Cell selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.section
        switch index {
        case 0:
            let vc = AppViewController()
            vc.title = funcDataContainers[index]["title"] as? String
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = NumberViewController()
            vc.title = funcDataContainers[index]["title"] as? String
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            return
        }
    }
    
}

