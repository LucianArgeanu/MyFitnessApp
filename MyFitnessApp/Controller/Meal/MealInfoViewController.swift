//
//  SaladViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 08/12/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit
import SDWebImage

class MealInfoViewController: UIViewController{
    
    @IBOutlet weak var proteinContainerView: UIView!
    @IBOutlet weak var carbsContainerView: UIView!
    @IBOutlet weak var fatContainerView: UIView!
    @IBOutlet weak var kcalContainerView: UIView!
    
    @IBOutlet weak var proteinValueLabel: UILabel!
    @IBOutlet weak var carbsValueLabel: UILabel!
    @IBOutlet weak var fatValueLabel: UILabel!
    @IBOutlet weak var kcalValueLabel: UILabel!
    
    @IBOutlet private var topImageView: UIImageView?
    @IBOutlet private var titleLabel: UILabel?
 
    @IBOutlet weak var textDescriptionLabel: UILabel!
    @IBOutlet private var titleLabelContainerView: UIView?
    @IBOutlet private var topContainerView: UIView?
    @IBOutlet private var bottomContainerView: UIView?
    
    private var saladsInfo: SaladsMenuContent?
    private var chickenInfo: ChickenMenuContent?
    private var shakeInfo: ShakeMenuContent?
    private var veganInfo: VeganMenuContent?
    private var breakfastInfo: BreakfastMenuContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        titleLabelContainerView?.layer.cornerRadius = 20
        initialize()
        
        //        bottomContainerView?.layer.cornerRadius = 50
        //        bottomContainerView?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        guard let saladMenu = saladsInfo else { return }
        titleLabel?.attributedText = NSAttributedString(string: saladMenu.name, attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 15)])
        //TODO : for image
        topImageView?.sd_setImage(with: saladMenu.imageURL, completed: nil)
        proteinValueLabel.text = saladMenu.nutrients?["protein"]
        carbsValueLabel.text = saladMenu.nutrients?["carbs"]
        fatValueLabel.text = saladMenu.nutrients?["fat"]
        kcalValueLabel.text = saladMenu.nutrients?["kcal"]
        
       
    }
    
    func initialize(){
       
        titleLabelContainerView?.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabelContainerView?.layer.borderWidth = 2.0
        proteinContainerView.layer.cornerRadius = 15.0
        carbsContainerView.layer.cornerRadius = 15.0
        fatContainerView.layer.cornerRadius = 15.0
        kcalContainerView.layer.cornerRadius = 15.0
        
    }
    
    func setupSalad(with saladsInfo: SaladsMenuContent) {
        self.saladsInfo = saladsInfo
    }
    
    func setupShake(with shakeInfo: ShakeMenuContent) {
           self.shakeInfo = shakeInfo
       }
       
    func setupChicken(with chickenInfo: ChickenMenuContent){
        self.chickenInfo = chickenInfo
    }
    
    func setupVegan(with veganInfo: VeganMenuContent){
        self.veganInfo = veganInfo
    }
    
    func setupBreakfast(with breakfastInfo: BreakfastMenuContent){
        self.breakfastInfo = breakfastInfo
    }
}
