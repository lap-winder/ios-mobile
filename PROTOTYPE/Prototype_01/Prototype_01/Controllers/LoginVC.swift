//
//  LoginVC.swift
//  Prototype_01
//
//  Created by 이동규 on 2021/10/24.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        guard let preVC = self.presentingViewController as? MainTBC else {
            return
        }
        guard let profileVC = preVC.viewControllers?[3] as? ProfileVC else {
            return
        }
        if let email = self.emailTextField.text, let pwd = self.passwordTextField.text {
            webservice().isValidUser(User(email: email, password: pwd), completion: { str in
                if str != nil {
                    let appDelegate = UIApplication.shared.delegate as? AppDelegate
                    appDelegate?.userToken = str!
                    profileVC.paramEmail = email
                    profileVC.paramPassword = pwd
                    self.dismiss(animated: true, completion: nil)
                } else {
                    // 알람으로 바꾸기
                    print("Something wrong.")
                }
            })
        }
    }
    
    @IBAction func didTapSignInButton(_ sender: Any) {
        //
    }
    
    @IBAction func didTapBackButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}