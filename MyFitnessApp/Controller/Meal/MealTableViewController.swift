//
//  MealTableViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 23/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class MealTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var controllerArray = ["SaladsTableViewController"]
    var array = [MealTableViewInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 350
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "CellTable", bundle: nil), forCellReuseIdentifier: "CellTable")
        tableView.register(UINib(nibName: "CellTableCollection", bundle: nil), forCellReuseIdentifier: "CellTableCollection")
        self.navigationController?.isNavigationBarHidden = false
        
        array.append(MealTableViewInfo(description: "Salads", image: #imageLiteral(resourceName: "getMeals")))
//        array.append(MealTableViewInfo(description: String, image: <#T##UIImage#>))
//        array.append(MealTableViewInfo(description: String, image: <#T##UIImage#>))
//        array.append(MealTableViewInfo(description: <#T##String#>, image: <#T##UIImage#>))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
        cell.imageCell.image =  array[indexPath.row].image
        cell.txt.text = array[indexPath.row].description
    
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let UIController = storyboard.instantiateViewController(withIdentifier: controllerArray[indexPath.row])
        self.navigationController?.pushViewController(UIController, animated: true)
    }
    }
    

