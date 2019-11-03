//
//  Model.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 03/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class InputData{
    let sexPickArray = ["Female","Male"]
    let activityPickArray = ["Sedentary","Lightly active","Moderately active","Very active","Extra active"]
    var bmrValue : Double = 0.0
    var height: Double = 165
    var weight: Double = 55
    var age: Double = 18
    var selectedSexValue: String = ""
    var selectedActivityValue: String = ""
}
