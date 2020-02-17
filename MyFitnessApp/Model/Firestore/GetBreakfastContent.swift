//
//  GetBreakfastContent.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 12/02/2020.
//  Copyright © 2020 Argeanu Lucian. All rights reserved.
//

import UIKit
import FirebaseFirestore

class GetBreakfastContent{
    class func getData(completion: @escaping ([BreakfastMenuContent]) -> Void){
        Firestore.firestore().collection("menuBreakfast").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                completion ([])
                return
            }
            
            var breakfastMenuResponse = [BreakfastMenuContent]()
            
            documents.forEach { (document) in
                let rowBreakfastMenuContent = document.data()
                if let rowBreakfastResponse = BreakfastMenuContent(data: rowBreakfastMenuContent){
                    breakfastMenuResponse.append(rowBreakfastResponse)
                }
            }
            
            breakfastMenuResponse.sort { (first, second) -> Bool in
                return first.order < second.order
            }
            completion(breakfastMenuResponse)
        }
    }
}

class BreakfastMenuContent{
    
    var name: String
    var order: Int
    var imageURL : URL
    var ingredients: [String]?
    var nutrients: [String : String]?
    
    init?(data: [String : Any]){
    guard let imageURLString = data["imageURL"] as? String,
    let imageURL = URL(string: imageURLString),
    let order = data["order"] as? Int,
    let name = data["name"] as? String else { return nil}
    
        self.imageURL = imageURL
        self.order = order
        self.name = name
        self.nutrients = data["nutrients"] as? [String:String]
        self.ingredients = data["ingredients"] as? [String]
    }
    
}
