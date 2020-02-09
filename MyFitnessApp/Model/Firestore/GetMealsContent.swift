//
//  GetMealsContent.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 06/01/2020.
//  Copyright © 2020 Argeanu Lucian. All rights reserved.
//

import Foundation
import FirebaseFirestore

class GetMealsContent{
    
    class func getData(completion: @escaping ([MealsContent]) -> Void){
        Firestore.firestore().collection("menuMeals").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                completion([])
                return
            }
            
            var mealsContentResponse = [MealsContent]()
            documents.forEach { (document) in
                let rowMeal = document.data()
                if let rowMealContent = MealsContent(data: rowMeal){
                    mealsContentResponse.append(rowMealContent)
                }
                mealsContentResponse.sort { (first, second) -> Bool in
                    return first.order < second.order
                }
            }
            completion(mealsContentResponse)
        }
    }
}

class MealsContent{
    
    var imageURL: URL
    var name: String
    var order: Int
    var textDescription: String?
    
    init?(data: [String:Any]){
        guard let imageURLString = data["imageURL"] as? String,
            let imageURL = URL(string: imageURLString),
            let name = data["name"] as? String,
        let order = data["order"] as? Int else { return nil }
    
        self.imageURL = imageURL
        self.name = name
        self.order = order
        self.textDescription = data["textDescription"] as? String
    }
}
