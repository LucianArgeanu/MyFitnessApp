//
//  ViewController.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 29/10/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit


class InputDataCaloriesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var inputData = InputData()
    
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
            return inputData.sexPickArray.count
        }else if pickerView.tag == 2{
            return inputData.activityPickArray.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return inputData.sexPickArray[row]
        }else if pickerView.tag == 2{
            return inputData.activityPickArray[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            inputData.selectedSexValue = inputData.sexPickArray[row]
            sexInputLabel.text = inputData.sexPickArray[row]
        }else if pickerView.tag == 2{
            inputData.selectedActivityValue = inputData.activityPickArray[row]
            activityInputLabel.text = inputData.activityPickArray[row]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if sexInputLabel === textField {
            sexInputLabel.text = inputData.selectedSexValue
        }
        
        if activityInputLabel === textField {
            activityInputLabel.text = inputData.selectedActivityValue
        }
        
        return true
    }
    
    func initialize(){
        inputData.selectedSexValue = inputData.sexPickArray.first ?? ""
        inputData.selectedActivityValue = inputData.activityPickArray.first ?? ""
        
        kgResultLabel.text = String(format:"%3.1f", inputData.weight) + "kg"
        heightResultLabel.text = String(format:"%3.0f", inputData.height) + "cm"
        ageResultLabel.text = String(format:"%3.0f", inputData.age) + " years old"
        
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
        inputData.height = Double(sender.value)
        let heightText = String(format: "%3.0f", inputData.height)
        heightResultLabel.text = "\(heightText) cm"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        inputData.weight = Double(sender.value)
        let weightText = String(format: "%3.1f", sender.value)
        kgResultLabel.text = "\(weightText) kg"
    }
    
    @IBAction func ageSliderChanged(_ sender: UISlider) {
        inputData.age = Double(sender.value)
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

        if inputData.selectedSexValue == "Female"{
            inputData.bmrValue = (Double(weightMultiplier) * inputData.weight) + (heightMultiplier * inputData.height) - (ageMultiplier * inputData.age) - 161
        }else if inputData.selectedSexValue == "Male"{
            inputData.bmrValue = (Double(weightMultiplier) * inputData.weight) + (heightMultiplier * inputData.height) - (ageMultiplier * inputData.age) + 5
        }
        
        switch inputData.selectedActivityValue{
        case "Sedentary":
            inputData.bmrValue *= 1.25
        case "Lightly active":
            inputData.bmrValue *= 1.375
        case "Moderately active":
            inputData.bmrValue *= 1.55
        case "Very active":
            inputData.bmrValue *= 1.725
        case "Extra active":
            inputData.bmrValue *= 1.9
        default:
            return inputData.bmrValue
        }
        
        return inputData.bmrValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "goToResultCalories"{
            let ResultCaloriesView = segue.destination as! ResultCaloriesViewController
            ResultCaloriesView.bmr = getBmrValue()
        }
    }
    
 
    
}

