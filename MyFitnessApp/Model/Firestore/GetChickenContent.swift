//
//  GetChickenContent.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 10/02/2020.
//  Copyright © 2020 Argeanu Lucian. All rights reserved.
//

import UIKit
import FirebaseFirestore

class GetChickenContent{
    class func getData(completion: @escaping ([ChickenMenuContent])-> Void){
        Firestore.firestore().collection("menuChicken").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                completion([])
                return 
            }
            
            var chickenMenuResponse = [ChickenMenuContent]()
            documents.forEach{ (document) in
                let rowChickenContent = document.data()
                if let rowChickenMenuContent = ChickenMenuContent(data: rowChickenContent){
                    chickenMenuResponse.append(rowChickenMenuContent)
                }
            }
            chickenMenuResponse.sort { (first, second) -> Bool in
                return first.order < second.order
            }
            completion(chickenMenuResponse)
        }
        
    }
}

class ChickenMenuContent{
    var imageURL : URL
    var ingredients : [String]?
    var name : String
    var order : Int
    var nutrients: [String : String]?
    
    init?(data: [String : Any]){
        guard let imageURLString = data["imageURL"] as? String,
        let imageURL = URL(string: imageURLString),
        let name = data["name"] as? String,
        let order = data["order"] as? Int else { return nil }
        
        self.imageURL = imageURL
        self.name = name
        self.order = order
        self.nutrients = data["nutrients"] as? [String : String]
        self.ingredients = data["ingredients"] as? [String]
    }
    
    
}
