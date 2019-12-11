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
        let controller = storyboard.instantiateViewController(identifier: "SaladViewController") as! SaladViewController
        self.navigationController?.pushViewController(controller, animated: true)
        controller.setup(with: array[indexPath.row])
    }
    
    func appendArray(){
        array.append(SaladsTableViewInfo(description: "Roasted Sweet Potato and Chickpea Salad", image: #imageLiteral(resourceName: "chickenChickPeaSalad")))
        array.append(SaladsTableViewInfo(description: "RBBQ Chicken Salad", image: #imageLiteral(resourceName: "bbqChickenSalad")))
        array.append(SaladsTableViewInfo(description: "Chicken, Bacon, and Strawberry Salad", image: #imageLiteral(resourceName: "chickenBaconSalad")))
        array.append(SaladsTableViewInfo(description: "Quinoa and Kale Protein Power Salad", image: #imageLiteral(resourceName: "quinoaSalad")))
        array.append(SaladsTableViewInfo(description: "Turkey Nachos Salad", image: #imageLiteral(resourceName: "turkeyNachosSalad")))
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







