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
    
    var mealsContentArray = [MealsContent]()
    var controllerArray = ["SaladsTableViewController", "ChickenTableViewController", "VeganTableViewController", "ShakeTableViewController", "BreakfastTableViewController"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        GetMealsContent.getData { [weak self] (mealContentMenu) in
            self?.mealsContentArray = mealContentMenu
            self?.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsContentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
        let cellInfo = mealsContentArray[indexPath.row]
        cell.imageCell.sd_setImage(with: cellInfo.imageURL, completed: nil)
        cell.txt.text = cellInfo.name
        		
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: controllerArray[indexPath.row])
        self.navigationController?.pushViewController(controller, animated: true)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//           let controller = storyboard.instantiateViewController(identifier:"foodviewcv") as! FoodViewController
//        controller.setupWith(food: ....)
//           self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
//    func appendArray(){
//        array.append(MealTableViewInfo(description: "Salads", image: #imageLiteral(resourceName: "getMeals")))
//        array.append(MealTableViewInfo(description: "Chicken Recipes", image: #imageLiteral(resourceName: "chickenMeal")))
//        array.append(MealTableViewInfo(description: "Vegan Recipes", image: #imageLiteral(resourceName: "vegan")))
//        array.append(MealTableViewInfo(description: "Protein Shakes & Smoothie", image: #imageLiteral(resourceName: "proteinShakeMeal")))
//        array.append(MealTableViewInfo(description: "Breakfasts under 300 calories", image: #imageLiteral(resourceName: "breakfastMeal")))
//
//    }
    
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


//class Product {
//    var image: URL
//    var description: String
//    var calories: Int
//    var protein: Int
//}
//
//class Menu {
//    var title: String //Vegan, Salad etc
//    var products: [Product]
//
//}
//
//let menuContent = [Menu]()


