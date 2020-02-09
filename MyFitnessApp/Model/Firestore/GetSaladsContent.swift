//
//  GetSaladsContent.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 06/01/2020.
//  Copyright © 2020 Argeanu Lucian. All rights reserved.
//

import Foundation
import FirebaseFirestore

class GetSaladsContent{
    class func getData(completion : @escaping ([SaladsMenuContent]) -> Void){
        Firestore.firestore().collection("menuSalads").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                completion([])
                return
            }
            
            var saladMenuResponse = [SaladsMenuContent]()
            documents.forEach { (document) in
                let rowSaladMenu = document.data()
                if let rowSaladMenuContent = SaladsMenuContent(data: rowSaladMenu){
                    saladMenuResponse.append(rowSaladMenuContent)
                }
            }
            saladMenuResponse.sort { (first, second) -> Bool in
                return first.order < second.order
            }
            completion(saladMenuResponse)
        }
    }
}

class SaladsMenuContent{
    var imageURL: URL
    var name: String
    var order: Int
    var nutrients : [String: String]?
    var ingredients: [String]?
    var recipe : String?
    
    init?(data: [String: Any]){
        guard let imageURLString = data["imageURL"] as? String,
            let imageURL = URL(string: imageURLString),
            let name = data["name"] as? String,
            let order = data["order"] as? Int else { return nil }
            
        self.nutrients = data["nutrients"] as? [String: String]
        self.ingredients = data["ingredients"] as? [String]
        self.recipe = data["recipe"] as? String
        self.imageURL = imageURL
        self.name = name
        self.order = order
    }
}
