//
//  LoginVC.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/11/23.
//

import Foundation
import UIKit

class LoginVC: UIViewController{
    var userModel = UserModel()
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    @IBOutlet weak var lblLoginFail: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userModel.printModel()
       /* txtID.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        txtPW.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        btnLogin.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "로그인"
    }
    
   
    
    func loginCheck(id: String, pw: String) -> Bool {
        for user in users{
            //로그인 성공
            if user.id == id && user.password == pw{
                return true
            }
        }
        
        return false
    }
    
    func shakeTextField(textField: UITextField) -> Void{
        UIView.animate(withDuration: 0.2, animations: {
            textField.frame.origin.x -= 50
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                textField.frame.origin.x += 100
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    textField.frame.origin.x -= 50
                })
            })
        })
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
        userModel.printModel()
        guard let id = txtID.text, !id.isEmpty else {return}
        guard let pw = txtPW.text, !pw.isEmpty else {return}
        let loginSuccess: Bool = loginCheck(id: id, pw: pw)
        if loginSuccess {
            print("로그인 성공")
            
        
            guard let tabbar = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") else { return }
            self.navigationController?.pushViewController(tabbar, animated: true)
            
        }
        else {
            print("로그인 실패")
            shakeTextField(textField: txtID)
            shakeTextField(textField: txtPW)
            lblLoginFail.isHidden = !lblLoginFail.isHidden
        }
        
    }
    
    @IBAction func btnClose(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnJoin(_ sender: Any) {
        
        let joinVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinEmailVC") as? JoinEmailVC
        joinVC?.emailDelegate = self
        self.navigationController?.pushViewController(joinVC!, animated: true)
    }
    
}

extension LoginVC: EmailDelegate{
    func setEmail(model: UserModel) {
        userModel.email = model.email
        userModel.id = model.id
        userModel.password = model.password
        userModel.birth = model.birth
        userModel.district = model.district
    }
}
