//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by omar Al-joundi on 4/11/20.
//  Copyright © 2020 omar Al-joundi. All rights reserved.
//

import Foundation
import UIKit


class LoginViewController : UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           emailTextField.text = ""
           passwordTextField.text = ""
       }
    @IBAction func loginTapped(_ sender: Any) {
        OnTheMap.login(username: emailTextField.text ?? "", password: passwordTextField.text ?? "") { (userid, error) in
            guard let userid = userid else {
                return
            }
           print("Im here1")
            self.handleLoginRespnse(userId: userid.account.key, error: error)
        }
        
        
    }
    
    func handleLoginRespnse(userId:String , error:Error?){
        print("Im here2")
            OnTheMap.getUserInfo(userId: userId, completion: performLoginView(sucssful:error:))
    }
    
    func performLoginView(sucssful:Bool,error:Error?){
        print("Im here3")
        if sucssful {
            print("Im here4")
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "completeLogin", sender: nil)
            }

        }
    }
}
