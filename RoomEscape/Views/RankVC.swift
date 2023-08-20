//
//  ReviewVC.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/12/06.
//

import Foundation
import UIKit

class RankVC: UIViewController{
    
    @IBOutlet weak var btnRegion: UIButton!
    @IBOutlet weak var btnOrder: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var btnFinish: UIButton!
    
    enum Picker{
        case region
        case order
    }
    var picker = Picker.region
    var regionManager = RegionManager()
    var orderStand = ["추천순", "리뷰순"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    @IBAction func btnRegion(_ sender: Any) {
        picker = Picker.region
        hiddenView.isHidden = false
        pickerView.reloadAllComponents()
    }
    @IBAction func btnOrder(_ sender: Any) {
        picker = Picker.order
        hiddenView.isHidden = false
        pickerView.reloadAllComponents()
    }
    @IBAction func btnFinish(_ sender: Any) {
        hiddenView.isHidden = true
    }
    
}

extension RankVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if picker == .region{
            return 2
        }
        else if picker == .order{
            return 1
        }
        else {
            return 0
        }
            
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch picker {
        case .region:
            if component == 0 {
                return regionManager.regions.count
            } else {
                let selectedCity = pickerView.selectedRow(inComponent: 0)
                return regionManager.regions[selectedCity].smallReg.count
            }
        case .order:
            return orderStand.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch picker {
        case .region:
            if component == 0 {
                return regionManager.regions[row].bigReg
            } else {
                let selectedCity = pickerView.selectedRow(inComponent: 0)
                return regionManager.regions[selectedCity].smallReg[row]
            }
        case .order:
            return orderStand[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch picker {
        case .region:
            if component == 0{
                pickerView.selectRow(0, inComponent: 1, animated: false)
            }
            
            let bigRegionIdx = pickerView.selectedRow(inComponent: 0)
            let selectedBigRegion = regionManager.regions[bigRegionIdx].bigReg
            let smallRegionIdx = pickerView.selectedRow(inComponent: 1)
            let selectedSmallRegion = regionManager.regions[bigRegionIdx].smallReg[smallRegionIdx]
            
            pickerView.reloadComponent(1)
            
            btnRegion.setTitle(selectedBigRegion + " . " + selectedSmallRegion, for: .normal)
            
        case .order:
            let selectedStandard = orderStand[row]
            btnOrder.setTitle(selectedStandard, for: .normal)
        }
        
    }
    
}
