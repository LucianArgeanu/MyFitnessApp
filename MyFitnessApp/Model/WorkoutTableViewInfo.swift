//
//  WorkoutTableViewInfo.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 03/12/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

struct WorkoutTableViewInfo{
     let description : String
     let imageName : String
    
     static func populateInfo() -> [WorkoutTableViewInfo]{
          let cell1 = WorkoutTableViewInfo(description: "Full Body", imageName: "fullbody")
          let cell2 = WorkoutTableViewInfo(description: "Push Pull Legs", imageName: "getMeals")
         let cell3 = WorkoutTableViewInfo(description: "HIIT", imageName: "abs")
         let cell4 = WorkoutTableViewInfo(description: "Upper Lower", imageName: "scale")
         return [cell1,cell2,cell3,cell4]
    }

}
