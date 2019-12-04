//
//  CellTableViewInfo.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 14/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

struct CellTableViewInfo{
    let description : String
    let imageName : String
   
    static func populateInfo() -> [CellTableViewInfo]{
         let cell1 = CellTableViewInfo(description: "Workouts", imageName: "getWorkouts")
         let cell2 = CellTableViewInfo(description: "Meals", imageName: "meals")
        let cell3 = CellTableViewInfo(description: "Step tracker", imageName: "getStep")
        let cell4 = CellTableViewInfo(description: "Calorie Calculator", imageName: "scale")
        return [cell1,cell2,cell3,cell4]
        
    }
  
}
