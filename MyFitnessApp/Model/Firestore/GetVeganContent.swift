//
//  GetVeganContent.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 12/02/2020.
//  Copyright © 2020 Argeanu Lucian. All rights reserved.
//

import UIKit
import FirebaseFirestore

class GetVeganContent{
    class func getData(completion : @escaping ([VeganMenuContent])-> Void){
        Firestore.firestore().collection("menuVegan").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else{
                completion([])
                return
            }
            
            var veganResponseMenu = [VeganMenuContent]()
            
            documents.forEach { (document) in
                let rowVeganContent = document.data()
                if let rowVeganMenuResponse = VeganMenuContent(data: rowVeganContent){
                    veganResponseMenu.append(rowVeganMenuResponse)
                }
            }
            veganResponseMenu.sort { (first, second) -> Bool in
                return first.order < second.order
            }
            completion(veganResponseMenu)
        }
    }
}

class VeganMenuContent{
    var name: String
    var ingredients: [String]?
    var nutrients: [String:String]?
    var order: Int
    var imageURL : URL
    
    init?(data : [String : Any]){
        guard let imageStringURL = data["imageURL"] as? String,
        let imageURL = URL(string: imageStringURL),
        let name = data["name"] as? String,
        let order = data["order"] as? Int else { return nil}
        
        self.name = name
        self.imageURL = imageURL
        self.order = order
        self.ingredients = data["ingredients"] as? [String]
        self.nutrients = data["nutrients"] as? [String:String]
    }
}
