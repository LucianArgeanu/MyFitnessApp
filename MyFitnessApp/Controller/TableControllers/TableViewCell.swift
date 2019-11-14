//
//  TableViewCell.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 14/11/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var cellTable : CellTableViewInfo!{
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateUI(){
        img.image = UIImage(named: cellTable.imageName)
        label.text = cellTable.description
        img.layer.cornerRadius = 12.0
        img.layer.masksToBounds = true
    }
}