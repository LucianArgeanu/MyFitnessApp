//
//  WorkoutTableViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 21/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = [WorkoutTableViewInfo]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        appendArray()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2 || indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
            cell.imageCell.image = array[indexPath.row].image
            cell.txt.text = array[indexPath.row].description
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableCollection", for: indexPath) as! CellTableCollection
            if indexPath.row == 1 {
                cell.imagesArray = [#imageLiteral(resourceName: "push"), #imageLiteral(resourceName: "pull"), #imageLiteral(resourceName: "legs")]
                cell.title.text = array[indexPath.row].description
            }
            else if indexPath.row == 3 {
                cell.imagesArray = [#imageLiteral(resourceName: "upperlower"), #imageLiteral(resourceName: "hiit")]
                cell.title.text = array[indexPath.row].description
            }
            return cell
        }
    }
    
    func appendArray(){
        array.append(WorkoutTableViewInfo(description: "Full Body", image: #imageLiteral(resourceName: "fullbody")))
        array.append(WorkoutTableViewInfo(description: "Push Pull Legs", image: #imageLiteral(resourceName: "fullbody")))
        array.append(WorkoutTableViewInfo(description: "HIIT", image: #imageLiteral(resourceName: "abs")))
        array.append(WorkoutTableViewInfo(description: "Upper Lower", image: #imageLiteral(resourceName: "fullbody")))
    }
    
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

