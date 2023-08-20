//
//  JoinEmailVC.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/11/23.
//

import Foundation
import UIKit

protocol EmailDelegate{
    func setEmail(model: UserModel)
}

class JoinEmailVC: UIViewController{
    
    var userModel = UserModel()
    open var emailDelegate: EmailDelegate? = nil
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "회원가입(1/5)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func btnNext(_ sender: Any) {
        guard let email = txtEmail.text, !email.isEmpty else {return}
        
        if userModel.isValidEmail(email: email){
            userModel.email = email
            emailDelegate?.setEmail(model: userModel)
            let joinIDVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinIDVC") as? JoinIDVC
            joinIDVC?.idDelegate = self
            self.navigationController?.pushViewController(joinIDVC!, animated: true)
        }
    }
    
}

extension JoinEmailVC: IDDelegate{
    func setID(model: UserModel) {
        userModel.id = model.id
        userModel.password = model.password
        userModel.birth = model.birth
        userModel.district = model.district
    }
}
