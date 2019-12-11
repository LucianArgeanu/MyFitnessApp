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
    
    
    var array = [MealTableViewInfo]()
    var controllerArray = ["SaladsTableViewController"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        appendArray()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
        cell.imageCell.image = array[indexPath.row].image
        cell.txt.text = array[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "SaladsTableViewController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func appendArray(){
        array.append(MealTableViewInfo(description: "Salads", image: #imageLiteral(resourceName: "getMeals")))
        array.append(MealTableViewInfo(description: "Chicken Recipes", image: #imageLiteral(resourceName: "chickenMeal")))
        array.append(MealTableViewInfo(description: "Vegan Recipes", image: #imageLiteral(resourceName: "vegan")))
        array.append(MealTableViewInfo(description: "Protein Shakes & Smoothie", image: #imageLiteral(resourceName: "proteinShakeMeal")))
        array.append(MealTableViewInfo(description: "Breakfasts under 300 calories", image: #imageLiteral(resourceName: "breakfastMeal")))
        
    }
    
    func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 350
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "CellTable", bundle: nil), forCellReuseIdentifier: "CellTable")
        tableView.register(UINib(nibName: "CellTableCollection", bundle: nil), forCellReuseIdentifier: "CellTableCollection")
        self.navigationController?.isNavigationBarHidden = false
    }
    
}





