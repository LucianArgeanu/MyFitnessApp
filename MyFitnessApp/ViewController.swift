//
//  ViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 29/10/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    let sexPickArray = ["Female","Male"]
    let activityPickArray = ["Sedentary","Lightly active","Moderately active","Very active","Extra active"]
    var bmrValue : Double = 0.0
    var height: Double = 165
    var weight: Double = 55
    var age: Double = 18
    var selectedSexValue: String = ""
    var selectedActivityValue: String = ""
    
    @IBOutlet weak var sexInputLabel: UITextField!
    @IBOutlet weak var activityInputLabel: UITextField!
   
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var ageSlider: UISlider!
    
    @IBOutlet weak var kgResultLabel: UILabel!
    @IBOutlet weak var ageResultLabel: UILabel!
    @IBOutlet weak var heightResultLabel: UILabel!
  
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
            selectedSexValue = sexPickArray[row]
            sexInputLabel.text = sexPickArray[row]
        }else if pickerView.tag == 2{
            selectedActivityValue = activityPickArray[row]
            activityInputLabel.text = activityPickArray[row]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if sexInputLabel === textField {
            sexInputLabel.text = selectedSexValue
        }
        
        if activityInputLabel === textField {
            activityInputLabel.text = selectedActivityValue
        }
        
        return true
    }
    
    func initialize(){
        selectedSexValue = sexPickArray.first ?? ""
        selectedActivityValue = activityPickArray.first ?? ""
        
        kgResultLabel.text = String(format:"%3.1f", weight) + "kg"
        heightResultLabel.text = String(format:"%3.0f", height) + "cm"
        ageResultLabel.text = String(format:"%3.0f", age) + " years old"
        
        let sexPicker = UIPickerView()
        sexPicker.delegate = self
        sexPicker.tag = 1
        sexInputLabel.inputView = sexPicker
        sexInputLabel.delegate = self
        let activityPicker = UIPickerView()
        activityPicker.delegate = self
        activityPicker.tag = 2
        activityInputLabel.inputView = activityPicker
        activityInputLabel.delegate = self
    }

   
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        height = Double(sender.value)
        let heightText = String(format: "%3.0f", height)
        heightResultLabel.text = "\(heightText) cm"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weight = Double(sender.value)
        let weightText = String(format: "%3.1f", sender.value)
        kgResultLabel.text = "\(weightText) kg"
    }
    
    @IBAction func ageSliderChanged(_ sender: UISlider) {
        age = Double(sender.value)
        let ageText = String(format: "%3.0f", sender.value)
        ageResultLabel.text = String(ageText) + " years old"
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResultCalories", sender: self)
    }
    
    func getBmrValue() -> Double {
        let ageMultiplier = 5.0
        let weightMultiplier = 10.0
        let heightMultiplier = 6.25

        if selectedSexValue == "Female"{
            bmrValue = (Double(weightMultiplier) * weight) + (heightMultiplier * height) - (ageMultiplier * age) - 161
        }else if selectedSexValue == "Male"{
            bmrValue = (Double(weightMultiplier) * weight) + (heightMultiplier * height) - (ageMultiplier * age) + 5
        }
        
        switch selectedActivityValue{
        case "Sedentary":
            bmrValue *= 1.25
        case "Lightly active":
            bmrValue *= 1.375
        case "Moderately active":
            bmrValue *= 1.55
        case "Very active":
            bmrValue *= 1.725
        case "Extra active":
            bmrValue *= 1.9
        default:
            return bmrValue
        }
        
        return bmrValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "goToResultCalories"{
            let ResultCaloriesView = segue.destination as! ResultCaloriesViewController
            ResultCaloriesView.bmr = getBmrValue()
        }
    }
    
 
    
}

