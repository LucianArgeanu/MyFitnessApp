//
//  GetShakesContent.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 12/02/2020.
//  Copyright © 2020 Argeanu Lucian. All rights reserved.
//

import UIKit
import FirebaseFirestore

class GetShakeContent{
    class func getData(completion : @escaping ([ShakeMenuContent]) -> Void){
        Firestore.firestore().collection("menuShakes").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else{
                completion ([])
                return
            }
            var shakesResponseMenu = [ShakeMenuContent]()
            documents.forEach { (document) in
                let rowShakeContent = document.data()
                if let rowShakeMenuContent = ShakeMenuContent(data: rowShakeContent){
                    shakesResponseMenu.append(rowShakeMenuContent)
                }
            }
            shakesResponseMenu.sort { (first, second) -> Bool in
                return first.order < second.order
            }
            completion(shakesResponseMenu)
        }
    }
}

class ShakeMenuContent{
    var order : Int
    var nutrients : [String : String]?
    var name : String
    var ingredients : [String]?
    var imageURL : URL
    
    init?(data : [String : Any]){
        guard let imageURLString = data["imageURL"] as? String,
            let imageURL = URL(string: imageURLString),
            let name = data["name"] as? String,
            let order = data["order"] as? Int else { return nil}
        
        self.imageURL = imageURL
        self.name = name
        self.order = order
        self.ingredients = data["ingredients"] as? [String]
        self.nutrients = data["nutrients"] as? [String : String]
    }
}
