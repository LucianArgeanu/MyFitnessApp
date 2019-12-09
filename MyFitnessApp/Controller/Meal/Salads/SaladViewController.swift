//
//  SaladViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 08/12/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class SaladViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var saladNameView: UIView!
    @IBOutlet weak var textView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Simple text"
        saladNameView.layer.cornerRadius = 20
        textView.layer.cornerRadius = 40
        text.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    
    func setup(with title: String, and image: UIImage) {
        self.label.text = title
        self.imageView.image = image
    }
    
}
