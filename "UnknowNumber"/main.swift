//
//  main.swift
//  "UnknowNumber"
//
//  Created by Vitaly Nabarouski on 4/22/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import Foundation
import Darwin


let randomDefaultValue = Double(arc4random())
getVaribles()

func getVaribles() {
    print("Enter three numbers please.")
    let a = set(varible: "a", defaultValue: randomDefaultValue)
    let b = set(varible: "b", defaultValue: randomDefaultValue)
    let c = set(varible: "c", defaultValue: randomDefaultValue)
    equation(a: a, b: b, c: c)
}

func equation(a:Double, b:Double, c:Double) {
    
    let discriminant = (b * b) - (4 * a * c)
    switch discriminant {
    case 0:
        let x = -b / (2 * a)
        print("Discriminant = \(discriminant).X = \(x)")
    case 1..<Double.greatestFiniteMagnitude:
        let x1 = (-b + sqrt(discriminant)) / (2 * a)
        let x2 = (-b - sqrt(discriminant)) / (2 * a)
        print("Discriminant = \(discriminant).First root = \(x1). Second root = \(x2)")
    default:
        print("Discriminant = \(discriminant).No roots in the equation")
    }
    
    whantToContinue()
}

func notValidData() {
    print("Check that the set of numbers is correct")
    whantToContinue()
}

func whantToContinue() {
    print("Do you want to continue y/n?")
    if let whant = readLine() {
        get(answer: whant)
    }
}

func get(answer: String) {
    let caseInsensitivAnswer = answer.lowercased()
    switch caseInsensitivAnswer {
    case "y":
        getVaribles()
    case "n":
        return
    default:
        print("Enter correct data Y or N")
        if let newAnswer = readLine() {
            get(answer: newAnswer)
        }
    }
}

func set(varible:String, defaultValue:Double) -> Double {
    print("\(varible) = ")
    let input = readLine()
    if let stringValue = input, let doubleValue = Double(stringValue) {
        return doubleValue
    }
    else if input == "" {
        print("\(randomDefaultValue)")
        return randomDefaultValue
    }
    else
    {
        print("Check that value for \(varible) is number and correct, please try again")
        return set(varible: varible, defaultValue: randomDefaultValue)
    }
}
