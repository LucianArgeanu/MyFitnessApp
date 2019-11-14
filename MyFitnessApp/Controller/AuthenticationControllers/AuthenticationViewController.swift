//
//  LoginViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 03/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit


class AuthenticationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginController = storyboard.instantiateViewController(identifier: "LoginViewController")
        self.navigationController?.pushViewController(loginController, animated: true)
    }
    
    @IBAction func RegisterButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let registerController = storyboard.instantiateViewController(identifier: "RegisterViewController")
        self.navigationController?.pushViewController(registerController, animated: true)
    }
    
}
