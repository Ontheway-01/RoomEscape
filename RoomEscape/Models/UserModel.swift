//
//  UserModel.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/11/30.
//

import Foundation
struct UserModel{
    var email: String!
    var id: String!
    var password: String!
    var birth: String?
    var district: String?
    
    func isValidEmail(email: String) -> Bool{
        let emailRegEx = "^[A-Z0-9a-z._%+_]+@naver.com"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    //id 형식 검사
    func isValidID(id: String) -> Bool{
        let idRegEx = "^[A-Z0-9a-z!@#$%^&*()_+]{8,}"
        let idTest = NSPredicate(format: "SELF MATCHES %@", idRegEx)
        return idTest.evaluate(with: id)
    }
    
    //password 형식 검사
    func isValidPassword(password: String) -> Bool{
        let pwRegEx = "^[A-Z0-9a-z!@#$%^&*()_+]{8,}$"
        let pwTest = NSPredicate(format: "SELF MATCHES %@", pwRegEx)
        return pwTest.evaluate(with: password)
    }

    func isValidBirth(birth: String) -> Bool{
        let birthRegEx = "^[0-9]{2} + / +[0-9]{2} + / +[0-9]{2}$"
        let birthTest = NSPredicate(format: "SELF MATCHES %@", birthRegEx)
        return birthTest.evaluate(with: birth)
    }
    func printModel(){
        print("email: ", email)
        print("id: ", id)
        print("pw: ", password)
        print("birth: ", birth)
        print("region: ", district)
        
    }
}
    
