//
//  VeganTableViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 12/02/2020.
//  Copyright © 2020 Argeanu Lucian. All rights reserved.
//

import UIKit

class VeganTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var veganMenuContentArray = [VeganMenuContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        GetVeganContent.getData { [weak self](veganContent) in
            self?.veganMenuContentArray = veganContent
            self?.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return veganMenuContentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable") as! CellTable
        let cellInfo = veganMenuContentArray[indexPath.row]
        cell.imageCell.sd_setImage(with: cellInfo.imageURL, completed: nil)
        cell.txt.text = cellInfo.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "MealInfoViewController") as! MealInfoViewController
        self.navigationController?.pushViewController(controller, animated: true)
        controller.setupVegan(with: veganMenuContentArray[indexPath.row])
        
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
