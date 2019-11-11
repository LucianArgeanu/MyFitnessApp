//
//  RegisterViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 04/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit
import Firebase
import ProgressHUD

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {

        ProgressHUD.show()
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] (user, error) in
            ProgressHUD.dismiss()
            if error != nil{
                print(error!)
            }else{
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let viewController = storyboard.instantiateViewController(identifier: "HomeViewController")
                self?.navigationController?.pushViewController(viewController, animated: true)
//                self.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
    }
    

}
