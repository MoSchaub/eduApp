//
//  Question.swift
//  eduApp
//
//  Created by Moritz Schaub on 19.01.20.
//  Copyright © 2020 Moritz Schaub. All rights reserved.
//

import Foundation

struct Question{
    var number1: Int
    var number2: Int
    
    var correctAnswer: Int{
        number1 * number2
    }
    
    func string() -> String {
        "Whats \(number1) times \(number2)?"
    }
    
    func possibleAnswers() -> [Int]{
        var array = [correctAnswer]
        array.append(correctAnswer+1)
        array.append(correctAnswer-1)
        array.append(correctAnswer+2)
        array.append(correctAnswer-2)
        
        array.append(number1 + 1 * number2)
        array.append(number1 + 2 * number2)
        if number1 > 3{
            array.append(number1 - 1 * number2)
            array.append(number1 - 2 * number2)
        }
        
        array.append(number2 + 1 * number2)
        array.append(number2 + 2 * number2)
        if number2 > 3{
            array.append(number2 - 1 * number2)
            array.append(number2 - 2 * number2)
        }
        
        return array.shuffled()
    }
}
