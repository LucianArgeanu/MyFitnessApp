//
//  WorkoutTableViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 21/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array : [WorkoutTableViewInfo] = WorkoutTableViewInfo.populateInfo()
   
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "CellTable", bundle: nil), forCellReuseIdentifier: "CellTable")
        tableView.register(UINib(nibName: "CellTableCollection", bundle: nil), forCellReuseIdentifier: "CellTableCollection")
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2 || indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
            cell.imageCell.image = UIImage(named: array[indexPath.row].imageName)
            cell.txt.text = array[indexPath.row].description
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableCollection", for: indexPath) as! CellTableCollection
            if indexPath.row == 1 {
                cell.imagesArray = ["push", "pull", "legs"]
                cell.title.text = array[indexPath.row].description
            }
            else if indexPath.row == 3 {
                cell.imagesArray = ["upperlower","lower"]
                cell.title.text = array[indexPath.row].description
            }
            return cell
        }
    }
    
}
