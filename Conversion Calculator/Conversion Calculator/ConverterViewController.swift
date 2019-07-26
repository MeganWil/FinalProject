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

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    var conversion = [ConvertUnits(label: "Fahrenheit to Celcius", input: "°F", output: "°C"),
        ConvertUnits(label: "Celcius to fahrenheit", input: "°C", output: "°F"),
        
        ConvertUnits(label: "Miles to Kilometers", input: "mi", output: "km"),
        
        ConvertUnits(label: "Kilometers to Miles", input: "km", output: "mi")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputDisplay.text = conversion[0].output
        inputDisplay.text = conversion[0].input
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Converter(_ sender: Any) {
        let options = UIAlertController(title: nil, message: "Choose Converter", preferredStyle: UIAlertController.Style.actionSheet)
        
        for convert in conversion{
            options.addAction(UIAlertAction(title: convert.label, style: UIAlertAction.Style.default, handler: {
                    (UIAlertAction) -> Void in self.inputDisplay.text = convert.input
                
                        self.outputDisplay.text = convert.output
                
            }))
        }
        
        self.present(options, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
