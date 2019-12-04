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
    
    var array : [SaladsTableViewInfo] = SaladsTableViewInfo.populateInfo()
    
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
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
               let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
           cell.imageCell.image = UIImage(named: array[indexPath.row].imageName)
           cell.txt.text = array[indexPath.row].description
       
               return cell
           }

}
