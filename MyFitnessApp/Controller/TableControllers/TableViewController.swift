//
//  TableViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 14/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController {

    @IBOutlet weak var userImage: UIImageView!
    let email = Auth.auth().currentUser?.email
    @IBOutlet weak var userLabelName: UILabel!
    var array : [CellTableViewInfo] = CellTableViewInfo.populateInfo()
    
//    ["getMeals","getWorkouts","getStep","getMeasure"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
        userImage.clipsToBounds = true
//        tableView.separatorStyle = .none
        userLabelName.text = String(email ?? "Username")
    }

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        
        let cellInfo = array[indexPath.row]
        
        cell.img.image = UIImage(named: cellInfo.imageName)
        cell.label.text = cellInfo.description
  
        return cell
    }
 
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        do{
            try  Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch{
            print("error while trying to sign out")
        }
    }
    
}
