//
//  MealTableViewInfo.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 04/12/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

struct MealTableViewInfo{
     let description : String
     let imageName : String
    
     static func populateInfo() -> [MealTableViewInfo]{
          let cell1 = MealTableViewInfo(description: "Salads", imageName: "getMeals")
          let cell2 = MealTableViewInfo(description: "Chicken Recipes", imageName: "chickenMeal")
         let cell3 = MealTableViewInfo(description: "Vegan Recipes", imageName: "vegan")
         let cell4 = MealTableViewInfo(description: "Protein Shakes & Smoothie", imageName: "proteinShakeMeal")
         let cell5 = MealTableViewInfo(description: "Breakfasts under 300 calories", imageName: "breakfastMeal")
         return [cell1,cell2,cell3,cell4,cell5]
    }

}
