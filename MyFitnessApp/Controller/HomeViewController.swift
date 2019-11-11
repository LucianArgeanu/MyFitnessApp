//
//  HomeViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 07/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func ButtonTest(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let inputCaloriesViewController = storyboard.instantiateViewController(identifier: "InputDataCaloriesViewController")
        self.navigationController?.pushViewController(inputCaloriesViewController, animated: true)
//        performSegue(withIdentifier: "goToCalorieCounter", sender: self)
    }
    

}
