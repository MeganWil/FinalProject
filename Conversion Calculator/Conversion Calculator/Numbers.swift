//
//  Numbers.swift
//  Conversion Calculator
//
//  Created by Megan Wilson on 7/26/19.
//  Copyright © 2019 Megan Wilson. All rights reserved.
//

import Foundation

class Numbers {
    var numbers: String
    
    init(numbers: String) {
        self.numbers = numbers
    }
    
    init() {
        self.numbers = ""
    }
    
    func append(_ appendNumber: Int) -> String{
        self.numbers = self.numbers + String(appendNumber)
        return self.numbers
    }
    
    func clear() {
        self.numbers = ""
    }
    
    func negative() {
        if self.numbers != ("") {
            self.numbers = String(Double(self.numbers)! * -1)
        }
    }
    
    func decimal() {
        if !self.numbers.contains(".") {
            self.numbers = self.numbers + "."
        }
    }
}
