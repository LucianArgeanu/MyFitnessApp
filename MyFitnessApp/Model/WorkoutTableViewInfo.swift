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
    let image : UIImage
    
    init(description : String, image : UIImage){
        self.description = description
        self.image = image
    }
}
