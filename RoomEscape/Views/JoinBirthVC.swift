//
//  JoinBirthVC.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/11/23.
//

import Foundation
import UIKit
protocol BirthDelegate{
    func setBirth(model: UserModel)
}
class JoinBirthVC:UIViewController{
    var userModel = UserModel()
    open var birthDelegate: BirthDelegate? = nil
    @IBOutlet weak var txtBirth: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnNext(_ sender: Any) {
        let birth = txtBirth.text ?? ""
        if userModel.isValidBirth(birth: birth){
            userModel.birth = birth
        }else{
            userModel.birth = ""
        }
        birthDelegate?.setBirth(model: userModel)
        let joinRegionVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinRegionVC") as? JoinRegionVC
            
        self.navigationController?.pushViewController(joinRegionVC!, animated: true)
    }
}

extension JoinBirthVC: RegionDelegate{
    func setRegion(model: UserModel) {
        userModel.district = model.district
    }
}
