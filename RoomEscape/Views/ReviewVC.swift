//
//  ReviewVC.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/12/28.
//

import Foundation
import UIKit
class ReviewVC: UIViewController{
    @IBOutlet weak var btnRegion: UIButton!
    @IBOutlet weak var btnSpot: UIButton!
    @IBOutlet weak var btnTheme: UIButton!
//    @IBOutlet weak var btnInterior: UIButton!
//    @IBOutlet weak var btnStory: UIButton!
//    @IBOutlet weak var btnFear: UIButton!
//    @IBOutlet weak var btnActivity: UIButton!
//    @IBOutlet weak var btnTotalGrade: UIButton!
//    @IBOutlet weak var btnFinish: UIButton!
//
//    @IBOutlet weak var lblInterior: UILabel!
//    @IBOutlet weak var lblStory: UILabel!
//    @IBOutlet weak var lblFear: UILabel!
//    @IBOutlet weak var lblActivity: UILabel!
//    @IBOutlet weak var lblTotalGrade: UILabel!
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var pickerView: ReviewPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenView.isHidden = true
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func btnRegion(_ sender: Any) {
        hiddenView.isHidden = false
        pickerView.setPickerMode(.region, button: btnRegion)
    }
    @IBAction func btnSpot(_ sender: Any) {
        pickerView.setPickerMode(.spot, button: btnSpot)
    }
    @IBAction func btnTheme(_ sender: Any) {
        pickerView.setPickerMode(.theme, button: btnTheme)
    }
//    @IBAction func btnInterior(_ sender: Any) {
////        hiddenView.isHidden = false
////        pickerView.setPickerMode(.interiorRate, label: lblInterior)
//    }
//    @IBAction func btnStory(_ sender: Any) {
////        hiddenView.isHidden = false
////        pickerView.setPickerMode(.storyRate, label: lblStory)
//    }
//    @IBAction func btnFear(_ sender: Any) {
////        hiddenView.isHidden = false
////        pickerView.setPickerMode(.fearRate, label: lblFear)
//    }
//    @IBAction func btnActivity(_ sender: Any) {
////        hiddenView.isHidden = false
////        pickerView.setPickerMode(.activityRate, label: lblActivity)
//    }
//    @IBAction func btnTotalGrade(_ sender: Any) {
////        hiddenView.isHidden = false
////        pickerView.setPickerMode(.totalGrade, label: lblTotalGrade)
//    }
    
    @IBAction func btnRating(_ sender: UIButton) {
        hiddenView.isHidden = false
        
        let buttonTag = sender.tag
        if let mode = PickerMode(rawValue: buttonTag),
           let label = self.view.viewWithTag(buttonTag + 1000) as? UILabel{
            pickerView.setPickerMode(mode, label: label)
        }
    }
    
    @IBAction func btnFinish(_ sender: Any) {
        hiddenView.isHidden = true
    }
}
