//
//  WorkoutCollectionViewCell.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 21/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit
import SDWebImage

class CellTableCollection: UITableViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var imagesArray = [URL]()
    
    @IBOutlet weak var title : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: "CellCollection", bundle: nil), forCellWithReuseIdentifier: "CellCollection")
    }
    
}

extension CellTableCollection : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCollection", for: indexPath) as! CellCollection
        
        cell.collectionImage.sd_setImage(with: URL(string: "https://firebasestorage.googleapis.com/v0/b/my-fitness-app-20927.appspot.com/o/menuContent%2FgetMeals.jpeg?alt=media&token=b2a67011-d5d2-4587-b42f-d7f0ca405082"), completed: nil)
//        cell.collectionImage.image = imagesArray[indexPath.row]
        cell.collectionImage.layer.cornerRadius = 10.0
        cell.collectionImage.clipsToBounds = true
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}
