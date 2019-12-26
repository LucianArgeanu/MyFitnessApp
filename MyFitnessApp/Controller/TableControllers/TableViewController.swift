//
//  TableViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 14/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit
import FirebaseAuth

class TableViewController: UITableViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    let email = Auth.auth().currentUser?.email
    @IBOutlet weak var userLabelName: UILabel!
    var array = [MenuContent]()
    var controllerArray : [String] = ["WorkoutTableViewController","MealTableViewController","StepViewController","InputDataCaloriesViewController"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        GetMenuContent.getData { [weak self] (menuContent) in
            self?.array = menuContent
            self?.tableView?.reloadData()
        }
//        appendArray()
    
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        let cellInfo = array[indexPath.row]

        cell.img.load(url: cellInfo.imageURL)
        cell.label.text = cellInfo.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let UIController = storyboard.instantiateViewController(withIdentifier: controllerArray[indexPath.row]) 
        self.navigationController?.pushViewController(UIController, animated: true)
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        do{
            try  Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch{
            print("error while trying to sign out")
        }
    }
    
    func appendArray(){
//        array.append(CellTableViewInfo(description: "Workouts", image: #imageLiteral(resourceName: "getWorkouts")))
//        array.append(CellTableViewInfo(description: "Meals", image: #imageLiteral(resourceName: "meals")))
//        array.append(CellTableViewInfo(description: "Step tracker", image: #imageLiteral(resourceName: "getStep")))
//        array.append(CellTableViewInfo(description: "Calorie Calculator", image: #imageLiteral(resourceName: "scale")))
    }
    
    func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
        userImage.clipsToBounds = true
        //        tableView.separatorStyle = .none
        userLabelName.text = String(email ?? "Username")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
