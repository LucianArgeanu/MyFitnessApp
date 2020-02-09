//
//  WorkoutTableViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 21/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit
import SDWebImage

class WorkoutTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var workoutsMenu = [WorkoutMenuContent]()
    //var workoutSchedule = [WorkoutSchedule]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        //1) incarcarea documentelor din Firestore
        GetWorkoutContent.getData { [weak self] (workoutMenuContent) in
            self?.workoutsMenu = workoutMenuContent
            self?.tableView?.reloadData()
        }
        // 2) conversia de la firestore snapshots la entitatile tale de Workout
        // 3) reload la tableView saafiseze datele
        //4) in cell for row at index path, inlocuit codul sa foloseasca entitatile de la server
//        appendArray()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutsMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
        let cellInfo = workoutsMenu[indexPath.row]
        cell.imageCell.sd_setImage(with: cellInfo.imageURL, completed: nil)
        cell.txt.text = cellInfo.name
//        let cellInfo = workoutSchedule[indexPath.row]
//        if cellInfo.workouts > 1 {
            //                var imagesArrayURLS = [URL]()
            //                workoutsMenu = workoutSchedule.array.sorted(by: { (first, second) -> Bool in
            //                    return first.subOrder ?? 0 < second.subOrder ?? 0
            //                })
            //                workoutSchedule[indexPath.row].workouts.forEach { (workoutMenuContent) in
            //                    imagesArrayURLS.append(workoutMenuContent.imageURL)
            //                }
            //                cell.imagesArray = imagesArrayURLS
            //                cell.title.text = workoutsMenu[indexPath.row].name
//        } else {
            //            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
            //            cell.imageCell.sd_setImage(with: cellInfo.imageURL, completed: nil)
            //            cell.txt.text = cellInfo.name
            //            return cell
//        }
        
//        let cellInfo = workoutsMenu[indexPath.row]
//        if indexPath.row == 2 || indexPath.row == 0{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
//            cell.imageCell.sd_setImage(with: cellInfo.imageURL, completed: nil)
//            cell.txt.text = cellInfo.name
//            return cell
//        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableCollection", for: indexPath) as! CellTableCollection
//            if indexPath.row == 1 || indexPath.row == 3 {
//                var imagesArrayURLS = [URL]()
//                workoutsMenu = workoutsMenu.sorted(by: { (first, second) -> Bool in
//                    return first.subOrder ?? 0 < second.subOrder ?? 0
//                })
//                workoutsMenu.forEach { (workoutMenuContent) in
//                    imagesArrayURLS.append(workoutMenuContent.imageURL)
//                }
//                cell.imagesArray = imagesArrayURLS
//                cell.title.text = workoutsMenu[indexPath.row].name
//            }
//            return cell
//        }
        // workout1, workout2, workout3, workout4, workout5
        // workoutSchedule
        // workoutSchedule1 -> [workout1, workout3, workout10]
        // workoutSchedule2 -> [workout10]
        // workoutSchedule1 -> [workout5, workou10, workout9]
        return cell
    }
    
//    func appendArray(){
//        array.append(WorkoutTableViewInfo(description: "Full Body", image: #imageLiteral(resourceName: "fullbody")))
//        array.append(WorkoutTableViewInfo(description: "Push Pull Legs", image: #imageLiteral(resourceName: "fullbody")))
//        array.append(WorkoutTableViewInfo(description: "HIIT", image: #imageLiteral(resourceName: "abs")))
//        array.append(WorkoutTableViewInfo(description: "Upper Lower", image: #imageLiteral(resourceName: "fullbody")))
//    }
//
    func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "CellTable", bundle: nil), forCellReuseIdentifier: "CellTable")
        tableView.register(UINib(nibName: "CellTableCollection", bundle: nil), forCellReuseIdentifier: "CellTableCollection")
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

