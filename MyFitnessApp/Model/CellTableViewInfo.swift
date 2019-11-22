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
         let cell1 = CellTableViewInfo(description: "getWorkouts", imageName: "getWorkouts")
         let cell2 = CellTableViewInfo(description: "getMeals", imageName: "getMeals")
        let cell3 = CellTableViewInfo(description: "getStep", imageName: "getStep")
        let cell4 = CellTableViewInfo(description: "getMeasure", imageName: "getMeasure")
        return [cell1,cell2,cell3,cell4]
        
    }
  
}
