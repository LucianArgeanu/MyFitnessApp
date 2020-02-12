//
//  ChickenTableViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 10/02/2020.
//  Copyright © 2020 Argeanu Lucian. All rights reserved.
//

import UIKit

class ChickenTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var chickenMenuArray = [ChickenMenuContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        GetChickenContent.getData { [weak self] (chickenMenuContent) in
            self?.chickenMenuArray = chickenMenuContent
            self?.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chickenMenuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable") as! CellTable
         let cellInfo = chickenMenuArray[indexPath.row]
        cell.imageCell.sd_setImage(with: cellInfo.imageURL, completed: nil)
        cell.txt.text = cellInfo.name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let controller = storyboard.instantiateViewController(identifier: "MealInfoViewController") as! MealInfoViewController
           self.navigationController?.pushViewController(controller, animated: true)
           controller.setupChicken(with: chickenMenuArray[indexPath.row])
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
