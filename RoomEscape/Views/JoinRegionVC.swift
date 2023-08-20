//
//  JoinRegionVC.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/11/23.
//

import Foundation
import UIKit
protocol RegionDelegate{
    func setRegion(model: UserModel)
}
class JoinRegionVC:UIViewController{
    var userModel = UserModel()
    var regionManager = RegionManager()
    var selectedRegion: Int = -1
    var region: String?
    var bigReg: String = ""
    var smallReg: String = ""
    open var regionDelegate: RegionDelegate? = nil
    @IBOutlet weak var lblRegion: UILabel!
    @IBOutlet weak var bigRegCollectionView: UICollectionView!
    @IBOutlet weak var smallRegCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigRegCollectionView.delegate = self
        bigRegCollectionView.dataSource = self
     //   bigRegCollectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "BigRegCell")
        
        smallRegCollectionView.delegate = self
        smallRegCollectionView.dataSource = self
   //     smallRegCollectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "SmallRegCell")
    }
    
    @IBAction func btnFinish(_ sender: Any) {
        userModel.district = region
        regionDelegate?.setRegion(model: userModel)
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension JoinRegionVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bigRegCollectionView{
            return regionManager.regions.count
        }
        if collectionView == smallRegCollectionView{
            if selectedRegion != -1{
                return regionManager.regions[selectedRegion].smallReg.count
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bigRegCollectionView{
            let cell = bigRegCollectionView.dequeueReusableCell(withReuseIdentifier: "BigRegCell", for: indexPath) as? BigRegCell
            cell?.setDate(info: regionManager.regions[indexPath.row].bigReg)
            return cell!
        }
        if collectionView == smallRegCollectionView{
            let cell = smallRegCollectionView.dequeueReusableCell(withReuseIdentifier: "SmallRegCell", for: indexPath) as? SmallRegCell
            if selectedRegion != -1{
                cell?.setDate(info: regionManager.regions[selectedRegion].smallReg[indexPath.row])
            }
            return cell!
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == bigRegCollectionView{
            selectedRegion = indexPath.row
            if let cell = collectionView.cellForItem(at: indexPath) as? BigRegCell {
                cell.isSelected = true
            }
            bigReg = regionManager.regions[indexPath.row].bigReg
            smallRegCollectionView.reloadData()
        }
        if collectionView == smallRegCollectionView{
            if let cell = collectionView.cellForItem(at: indexPath) as? SmallRegCell {
                cell.isSelected = true
            }
            smallReg = regionManager.regions[selectedRegion].smallReg[indexPath.row]
            region = bigReg + "." + smallReg
        }
        lblRegion.text = region
    }
}

extension JoinRegionVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 100
        let cellHeight = 50
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
