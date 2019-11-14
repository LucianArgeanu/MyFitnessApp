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
    @IBOutlet weak var errorLabel: UILabel!
    
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
                
                let err = error! as NSError
                if err.code == AuthErrorCode.emailAlreadyInUse.rawValue{
                    self!.errorLabel.text = "The email address is already in use by another account"
                }
                
                self?.registerValidation()
            }else{
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let viewController = storyboard.instantiateViewController(identifier: "TableViewController")
                self?.navigationController?.pushViewController(viewController, animated: true)
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
    
    func registerValidation(){
        let emailRegex = validateEmail(candidate: emailTextField?.text ?? "Enter an email")
        let passwordRegex = validatePassword(candidate: passwordTextField?.text ?? "Enter an password")
        
        if emailRegex == false{
            errorLabel.text = "Email is invalid or must be provided"
        }
        if passwordRegex == false{
            errorLabel.text = "The password must be 6 characters long or more"
        }
    }
    
    
}
