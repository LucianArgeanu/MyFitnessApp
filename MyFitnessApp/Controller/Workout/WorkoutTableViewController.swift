//
//  WorkoutTableViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 21/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array : [String] = ["getMeals", "getStep", "getWorkouts"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 350
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CellTable", bundle: nil), forCellReuseIdentifier: "CellTable")
        tableView.register(UINib(nibName: "CellTableCollection", bundle: nil), forCellReuseIdentifier: "CellTableCollection")
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 || indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
            cell.imageCell.image = UIImage(named: array[indexPath.row])
           
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableCollection", for: indexPath) as! CellTableCollection
            if indexPath.row == 0 {
                cell.imagesArray = ["getMeals", "getMeasure", "getWorkouts"]
                cell.title.text = "Hello"
            }
            else if indexPath.row == 2 {
                cell.imagesArray = ["getMeals", "getMeals", "getMeals", "getMeals", "getMeasure", "getWorkouts"]
                cell.title.text = "Hello"
            }
            return cell
        }
    }
    
}
