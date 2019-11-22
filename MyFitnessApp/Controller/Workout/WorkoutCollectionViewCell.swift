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
    

    
let array  = [["getMeals", "getMeasure", "getWorkouts"],["getStep", "getStep", "getStep"]]
   
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
       
        collectionView.register(UINib(nibName: "WorkoutCollectionCell", bundle: nil), forCellWithReuseIdentifier: "WorkoutCollectionCell")
    }

}

extension WorkoutCollectionViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
   func numberOfSections(in collectionView: UICollectionView) -> Int {
    return array.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array[section].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCollectionCell", for: indexPath) as! WorkoutCollectionCell
        
        cell.collectionImage.image = UIImage(named: array[indexPath.section][indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}
