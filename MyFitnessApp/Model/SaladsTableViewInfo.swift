//
//  SaladsTableViewInfo.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 04/12/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

struct SaladsTableViewInfo{
     let description : String
     let imageName : String
    
     static func populateInfo() -> [SaladsTableViewInfo]{
          let cell1 = SaladsTableViewInfo(description: "Roasted Sweet Potato and Chickpea Salad", imageName: "chickenChickPeaSalad")
          let cell2 = SaladsTableViewInfo(description: "BBQ Chicken Salad", imageName: "bbqChickenSalad")
         let cell3 = SaladsTableViewInfo(description: "Chicken, Bacon, and Strawberry Salad", imageName: "chickenBaconSalad")
         let cell4 = SaladsTableViewInfo(description: "Quinoa and Kale Protein Power Salad", imageName: "quinoaSalad")
         let cell5 = SaladsTableViewInfo(description: "Turkey Nachos Salad", imageName: "turkeyNachosSalad")
         return [cell1,cell2,cell3,cell4,cell5]
    }

}
