//
//  JoinPWVC.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/11/23.
//

import Foundation
import UIKit
protocol PWDelegate{
    func setPW(model: UserModel)
}
class JoinPWVC:UIViewController{
    var userModel = UserModel()
    open var pwDelegate: PWDelegate? = nil
    @IBOutlet weak var txtPW: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnNext(_ sender: Any) {
        guard let pw = txtPW.text, !pw.isEmpty else {return}
        
        if userModel.isValidPassword(password: pw){
            userModel.password = pw
            pwDelegate?.setPW(model: userModel)
            let joinBirthVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinBirthVC") as? JoinBirthVC
            joinBirthVC?.birthDelegate = self
            self.navigationController?.pushViewController(joinBirthVC!, animated: true)

        }
    }
}

extension JoinPWVC: BirthDelegate{
    func setBirth(model: UserModel) {
        userModel.birth = model.birth
        userModel.district = model.district
    }
}
