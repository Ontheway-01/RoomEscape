//
//  BigRegCell.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/12/08.
//

import Foundation
import UIKit
class BigRegCell: UICollectionViewCell{
    @IBOutlet weak var lblReg: UILabel!
    override var isSelected: Bool{
        didSet{
            if isSelected {
                self.layer.backgroundColor = UIColor.yellow.cgColor
            }else{
                
                self.layer.backgroundColor = UIColor.white.cgColor
            }
        }
    }
    func setDate(info: String){
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.black.cgColor
        self.lblReg.text = info
    }
}
