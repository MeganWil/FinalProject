//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Megan Wilson on 7/10/19.
//  Copyright © 2019 Megan Wilson. All rights reserved.
//

import UIKit

struct ConvertUnits {
    let label: String
    let input: String
    let output: String
}

enum ConverterType: String{
    case FahrenheitToCelsius = "Fahrenheit to Celcius"
    case CelciusToFahrenheit = "Celcius to Fahrenheit"
    case MilesToKilometers = "Miles to Kilometers"
    case KilometersToMiles = "Kilometers to Miles"
}

class ConverterViewController: UIViewController {
    
    struct Convert {
        var label: String
        var inputUnit: String
        var outputUnit: String
    }
    
    var currentConv: Convert?
    var currentInput: Numbers?
    var converter = [Convert]()
    
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    func updateConv() {
        if currentConv?.label == "Farhenheit to Celcius" && currentInput?.numbers != "" {
            if let number = Double(currentInput!.numbers) {
                outputDisplay.text = String((number - 32) * (5/9)) + " " + currentConv!.outputUnit
            }
        }
        if currentConv?.label == "Celcius to Farhenheit" && currentInput?.numbers != "" {
            outputDisplay.text = String(Double(currentInput!.numbers)!*(9/5) + 32) + " " + currentConv!.outputUnit
        }
        if currentConv?.label == "Miles to Kilometers" && currentInput?.numbers != "" {
            outputDisplay.text = String(Double(currentInput!.numbers)! * 1.61) + " " + currentConv!.outputUnit
        }
        if currentConv?.label == "Kilometers to Miles" && currentInput?.numbers != "" {
            outputDisplay.text = String(Double(currentInput!.numbers)! / 1.61) + " " + currentConv!.outputUnit
        }
    }
    
    @IBAction func zero(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(0))! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func one(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(1))! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func two(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(2))! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func three(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(3))! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func four(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(4))! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func five(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(5))! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func six(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(6))! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func seven(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(7))! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func eight(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(8))! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func nine(_ sender: Any) {
        inputDisplay.text = (currentInput?.append(9))! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func decimal(_ sender: Any) {
        currentInput?.decimal()
        inputDisplay.text = (currentInput?.numbers)! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func clear(_ sender: Any) {
        currentInput?.clear()
        inputDisplay.text = (currentInput?.numbers)! + " " + currentConv!.inputUnit
        outputDisplay.text = (currentInput?.numbers)! + " " + currentConv!.outputUnit
    }
    
    @IBAction func negativeOrPositive(_ sender: Any) {
        currentInput?.negative()
        inputDisplay.text = (currentInput?.numbers)! + " " + currentConv!.inputUnit
        updateConv()
    }
    
    @IBAction func Converter(_ sender: Any) {
        let options = UIAlertController(title: nil, message: "Choose converter", preferredStyle: UIAlertController.Style.alert)
        
        options.addAction(UIAlertAction(title: converter[0].label, style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.currentConv = self.converter[0]
            self.inputDisplay.text = self.currentInput!.numbers + " " + self.currentConv!.inputUnit
            self.outputDisplay.text = " " + self.currentConv!.outputUnit
            self.updateConv()
        }))
        
        options.addAction(UIAlertAction(title: converter[1].label, style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.currentConv = self.converter[1]
            self.inputDisplay.text = self.currentInput!.numbers + " " + self.currentConv!.inputUnit
            self.outputDisplay.text = " " + self.currentConv!.outputUnit
            self.updateConv()
        }))
        
        options.addAction(UIAlertAction(title: converter[2].label, style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.currentConv = self.converter[2]
            self.inputDisplay.text = self.currentInput!.numbers + " " + self.currentConv!.inputUnit
            self.outputDisplay.text = " " + self.currentConv!.outputUnit
            self.updateConv()
        }))
        
        options.addAction(UIAlertAction(title: converter[3].label, style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.currentConv = self.converter[3]
            self.inputDisplay.text = self.currentInput!.numbers + " " + self.currentConv!.inputUnit
            self.outputDisplay.text = " " + self.currentConv!.outputUnit
            self.updateConv()
        }))
        
        self.present(options, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        converter.append(Convert(label: "Farhenheit to Celcius", inputUnit: "°F", outputUnit: "°C"))
        converter.append(Convert(label: "Celcius to Farhenheit", inputUnit: "°C", outputUnit: "°F"))
        converter.append(Convert(label: "Miles to Kilometers", inputUnit: "mi", outputUnit: "km"))
        converter.append(Convert(label: "Kilometers to Miles", inputUnit: "km", outputUnit: "mi"))
        
        currentConv = converter[0]
        
        currentInput = Numbers()
        inputDisplay.text = currentInput!.numbers + " " + currentConv!.inputUnit
        outputDisplay.text = currentInput!.numbers + " " + currentConv!.outputUnit
        // Do any additional setup after loading the view.
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
