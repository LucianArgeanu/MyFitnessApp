//
//  LoginViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 04/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit
import FirebaseAuth
import ProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLoginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        ProgressHUD.show()
     
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] (user, error) in
            ProgressHUD.dismiss()
            if error != nil{
                print(error!)
                self?.loginValidation()
            }else{
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let viewController = storyboard.instantiateViewController(identifier: "tabBarVC")
                viewController.modalPresentationStyle = .overFullScreen
                self?.present(viewController, animated: false, completion: nil)
                //                self.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
    }
    
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Za-z0-9]{1,20}@[A-Za-z0-9]{1,20}.[a-z]{3,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
    
    func validatePassword(candidate: String) -> Bool {
        let passwordRegex = "[A-Z0-9a-z._%+-]{6,20}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: candidate)
    }
    
    func loginValidation(){
        let emailRegex = validateEmail(candidate: emailTextField?.text ?? "Enter an email")
        let passwordRegex = validatePassword(candidate: passwordTextField?.text ?? "Enter an password")
        if emailRegex == false && passwordRegex == false{
            errorLoginLabel.text = "Email or password is badly formatted"
        }else if emailRegex == false{
            errorLoginLabel.text = "Email is invalid"
        }else if passwordRegex == false{
            errorLoginLabel.text = "The password is invalid"
        }else{
            errorLoginLabel.text = "Email or password is incorrect"
        }
    }
    
}
