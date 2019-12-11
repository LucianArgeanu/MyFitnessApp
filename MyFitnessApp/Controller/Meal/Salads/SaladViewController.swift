//
//  SaladViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 08/12/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit

class SaladViewController: UIViewController{
    
    @IBOutlet private var topImageView: UIImageView?
    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var descriptionTextView: UITextView?
    @IBOutlet private var titleLabelContainerView: UIView?
    @IBOutlet private var topContainerView: UIView?
    @IBOutlet private var bottomContainerView: UIView?
    private var saladsTableViewInfo: SaladsTableViewInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabelContainerView?.layer.cornerRadius = 20
        bottomContainerView?.layer.cornerRadius = 50
        bottomContainerView?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let saladsTableViewInfo = saladsTableViewInfo else { return }
        titleLabel?.attributedText = NSAttributedString(string: saladsTableViewInfo.description, attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 15)])
        topImageView?.image = saladsTableViewInfo.image
    }
    
    
    func setup(with saladsTableViewInfo: SaladsTableViewInfo) {
        self.saladsTableViewInfo = saladsTableViewInfo
    }
    
}
