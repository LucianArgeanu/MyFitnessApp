//
//  ViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 29/10/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let sexPickArray = ["Female","Male"]
    let activityPickArray = ["Sedentary","Lightly active","Moderately active","Very active","Extra active"]
   
   
    @IBOutlet weak var sexInputLabel: UITextField!
    @IBOutlet weak var activityInputLabel: UITextField!
   
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var ageSlider: UISlider!
    
    @IBOutlet weak var kgResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return sexPickArray.count
        }else if pickerView.tag == 2{
            return activityPickArray.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return sexPickArray[row]
        }else if pickerView.tag == 2{
            return activityPickArray[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            sexInputLabel.text = sexPickArray[row]
        }else if pickerView.tag == 2{
            activityInputLabel.text = activityPickArray[row]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func initialize(){
        let sexPicker = UIPickerView()
        sexPicker.delegate = self
        sexPicker.tag = 1
        sexInputLabel.inputView = sexPicker
        
        let activityPicker = UIPickerView()
        activityPicker.delegate = self
        activityPicker.tag = 2
        activityInputLabel.inputView = activityPicker
    }
    
   
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = sender.value
        kgResultLabel.text = "\(height)kg"
    }
}

