//
//  WorkoutTableViewCell.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 21/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class CellTable: UITableViewCell {

    @IBOutlet weak var imageCell : UIImageView!
    @IBOutlet weak var txt : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
