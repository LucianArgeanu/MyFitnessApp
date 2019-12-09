//
//  SaladsTableViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 04/12/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class SaladsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = [SaladsTableViewInfo]()
    
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
        
        array.append(SaladsTableViewInfo(description: "Salads", image: #imageLiteral(resourceName: "trx-home")))
        array.append(SaladsTableViewInfo(description: "Salads", image: #imageLiteral(resourceName: "trx-home")))
        array.append(SaladsTableViewInfo(description: "Salads", image: #imageLiteral(resourceName: "trx-home")))
        array.append(SaladsTableViewInfo(description: "Salads", image: #imageLiteral(resourceName: "trx-home")))
        array.append(SaladsTableViewInfo(description: "Salads", image: #imageLiteral(resourceName: "trx-home")))
        array.append(SaladsTableViewInfo(description: "Salads", image: #imageLiteral(resourceName: "trx-home")))
        array.append(SaladsTableViewInfo(description: "Salads", image: #imageLiteral(resourceName: "trx-home")))
        
        //                array.append(MealTableViewInfo(description: "Chicken Recipes", imageName: "chickenMeal")
        //               let cell3 = MealTableViewInfo(description: "Vegan Recipes", imageName: "vegan")
        //               let cell4 = MealTableViewInfo(description: "Protein Shakes & Smoothie", imageName: "proteinShakeMeal")
        //               let cell5 = MealTableViewInfo(description: "Breakfasts under 300 calories", imageName: "breakfastMeal")
        //               return [cell1,cell2,cell3,cell4,cell5]
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
        
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SaladViewController") as? SaladViewController else { return }
        
        let info = array[indexPath.row]
        viewController.setup(with: info.description, and: info.image)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}







