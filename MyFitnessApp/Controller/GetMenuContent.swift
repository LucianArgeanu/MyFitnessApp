//
//  GetMenuContent.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 13/12/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import Foundation
import FirebaseFirestore

class GetMenuContent {
    
    class func getData(completion: @escaping (([MenuContent]) -> Void)) {
        Firestore.firestore().collection("menuContent").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                completion([])
                return
            }
            
            var menuContentResponse = [MenuContent]()
            documents.forEach { (document) in
                let rawMenuContent = document.data()
                if let menuContent = MenuContent(data: rawMenuContent) {
                    menuContentResponse.append(menuContent)
                }
            }
            menuContentResponse.sort { (first, second) -> Bool in
                return first.order < second.order
            }
            completion(menuContentResponse)
        }
    }
}


class MenuContent {
    var imageURL: URL
    var name: String
    var order: Int
    
    init?(data: [String: Any]) {
        guard let order = data["order"] as? Int,
                let name = data["name"] as? String,
                let imageURLString = data["imageURL"] as? String,
                let imageURL = URL(string: imageURLString) else { return nil }
        
        self.imageURL = imageURL
        self.name = name
        self.order = order
    }
}
