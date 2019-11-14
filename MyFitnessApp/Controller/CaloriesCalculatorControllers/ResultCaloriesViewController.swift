//
//  ResultCaloriesViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 01/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class ResultCaloriesViewController: UIViewController {

    var bmr : Double = 0.0
    var weightLossValue : Double = 0.0
    var weightGainValue : Double = 0.0
    
    @IBOutlet weak var bmrLabel: UILabel!
    @IBOutlet weak var weightLossLabel: UILabel!
    @IBOutlet weak var weightGainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmrLabel.text = String(format:"%3.0f",bmr)
        weightLossLabel.text = String(format:"%3.0f", bmr - 300)
        weightGainLabel.text = String(format:"%3.0f", bmr + 400)
    }


}
