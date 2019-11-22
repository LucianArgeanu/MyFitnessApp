//
//  WorkoutCollectionViewCell.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 21/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class WorkoutCollectionViewCell: UITableViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var imagesArray = [String]()
    
    @IBOutlet weak var title : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "WorkoutCollectionCell", bundle: nil), forCellWithReuseIdentifier: "WorkoutCollectionCell")
    }
    
}

extension WorkoutCollectionViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCollectionCell", for: indexPath) as! WorkoutCollectionCell
        
        
        cell.collectionImage.image = UIImage(named: imagesArray[indexPath.row])
        cell.collectionImage.layer.cornerRadius = 10.0
        cell.collectionImage.layer.borderWidth = 3.0
        cell.collectionImage.layer.borderColor = UIColor.black.cgColor
        cell.collectionImage.clipsToBounds = true
        title.text = imagesArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}
