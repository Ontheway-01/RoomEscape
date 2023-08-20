//
//  ReviewPickerView.swift
//  RoomEscape
//
//  Created by 이은화 on 2023/02/02.
//

import Foundation
import UIKit


enum PickerMode: Int {
    case region
    case spot
    case theme
    case interiorRate  = 1001
    case storyRate
    case fearRate
    case activityRate
    case totalGrade
}

class ReviewPickerView: UIPickerView {
    
    let totalGrade = ["인생테마🎉", "꽃밭길💐", "꽃길🌸", "풀꽃길🍀", "풀길🌱", "흙길🐾"]
    let starRate = ["⭐️ ⭐️ ⭐️ ⭐️ ⭐️","⭐️ ⭐️ ⭐️ ⭐️","⭐️ ⭐️ ⭐️","⭐️ ⭐️","⭐️"]

    var regionManager = RegionManager()
    
    var picker = PickerMode.region
    
    var returnLabel: UILabel? = nil
    var returnButton: UIButton? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.delegate = self
        self.dataSource = self
    }
    
    func setPickerMode(_ mode: PickerMode, label: UILabel?) {
        picker = mode
        returnLabel = label
        returnButton = nil
        
        self.reloadAllComponents()
        selectRow(0, inComponent: 0, animated: true)
    }
    
    func setPickerMode(_ mode: PickerMode, button: UIButton?) {
        picker = mode
        returnLabel = nil
        returnButton = button
        
        self.reloadAllComponents()
    }
    
}


extension ReviewPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if picker == .region{
            return 2
        }
        else{
            return 1
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
        case .interiorRate,
             .storyRate,
             .fearRate,
             .activityRate:
            return starRate.count
        case .totalGrade:
            return totalGrade.count
        default:
            return 0
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
        case .interiorRate,
             .storyRate,
             .fearRate,
             .activityRate:
            return starRate[row]
        case .totalGrade:
            return totalGrade[row]
        default:
            return nil
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
            
            returnButton?.setTitle(selectedBigRegion + " . " + selectedSmallRegion, for: .normal)
        case .interiorRate, .storyRate, .fearRate, .activityRate:
            let selectedRate = starRate[row]
            returnLabel?.text = selectedRate
        case .totalGrade:
            let selectedGrade = totalGrade[row]
            returnLabel?.text = selectedGrade
        default:
            self.isHidden = true
        }
    }
}
