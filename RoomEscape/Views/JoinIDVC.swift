//
//  JoinIDVC.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/11/23.
//

import Foundation
import UIKit

protocol IDDelegate{
    func setID(model: UserModel)
}
class JoinIDVC: UIViewController{
    var userModel = UserModel()
    open var idDelegate: IDDelegate? = nil
    @IBOutlet weak var txtID: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        guard let id = txtID.text, !id.isEmpty else {return}
        
        if userModel.isValidID(id: id){
            userModel.id = id
            idDelegate?.setID(model: userModel)
            let joinPWVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinPWVC") as? JoinPWVC
            joinPWVC?.pwDelegate = self
            self.navigationController?.pushViewController(joinPWVC!, animated: true)
        }
        
    }
}

extension JoinIDVC: PWDelegate{
    func setPW(model: UserModel) {
        userModel.password = model.password
        userModel.birth = model.birth
        userModel.district = model.district
    }
}
