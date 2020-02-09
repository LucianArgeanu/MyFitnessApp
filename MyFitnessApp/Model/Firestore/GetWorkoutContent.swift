//
//  GetWorkoutContent.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 13/12/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import Foundation
import FirebaseFirestore

class GetWorkoutContent{
    class func getData(completion: @escaping (([WorkoutMenuContent]) -> Void)) {
        Firestore.firestore().collection("menuWorkouts").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else{
                completion([])
                return 
            }
            
            var workoutMenuResponse = [WorkoutMenuContent]()
            documents.forEach { (document) in
                let rowWorkoutMenuContent = document.data()
                if let workoutMenuContent = WorkoutMenuContent(data: rowWorkoutMenuContent){
                    workoutMenuResponse.append(workoutMenuContent)
                }
            }
            workoutMenuResponse.sort { (first, second) -> Bool in
                return first.order < second.order
            }
            completion(workoutMenuResponse)
        }
    }
    
}

class WorkoutSchedule {
    var workoutscontent = [WorkoutMenuContent]()
}

class WorkoutMenuContent{
    var order: Int
    var imageURL: URL
    var name: String
   
    
    init?(data: [String: Any]){
        guard let name = data["name"] as? String,
            let order = data["order"] as? Int,
            let imageURLString = data["imageURL"] as? String,
            let imageURL = URL(string: imageURLString) else { return nil}
        
        self.order = order
        self.imageURL = imageURL
        self.name = name

    }
}
