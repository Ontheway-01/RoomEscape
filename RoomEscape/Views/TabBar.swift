//
//  TabBar.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/12/06.
//

import Foundation
import UIKit

class TabBar: UITabBarController{
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.async {
            self.presentLoginNavigation()
        }
    }
    
    func presentLoginNavigation() {
        let loginNavVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavigationController") as? UINavigationController
        if let loginNavVC = loginNavVC {
            //loginNavVC.modalPresentationStyle = .fullScreen
            self.navigationController?.present(loginNavVC, animated: true, completion: nil)
        }
    }
    
}
