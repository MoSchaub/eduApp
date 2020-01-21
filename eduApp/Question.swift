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
    
    private var answers: [Int]
    
    var correctAnswer: Int{
        number1 * number2
    }
    init(number1: Int, number2: Int) {
        self.number1 = number1
        self.number2 = number2
        answers = Question.generatePossibleAnswers(number1: number1, number2: number2)
    }
    
    func questionView() -> QuestionView {
        QuestionView(firstNumber: number1, secondNumber: number2)
    }
    
    private static func generatePossibleAnswers(number1: Int, number2: Int) -> [Int]{
            var array = [Int]()
        let correctAnswer = number1 * number2
            array.append(correctAnswer+1)
            array.append(correctAnswer-1)
            array.append(correctAnswer+2)
            array.append(correctAnswer-2)
            
            array.append(number1 + 1 * number2)
            array.append(number1 + 2 * number2)
            
            array.append(number2 + 1 * number2)
            array.append(number2 + 2 * number2)
            
            array.shuffle()
            
            //remove until only 2 items left
            while array.count > 2{
                array.removeLast()
            }
            array.append(correctAnswer)
            array.shuffle()
            
            return array.uniques
    }
    
    func possibleAnswers() -> [Int]{
        return self.answers
    }
    
    }


extension Array where Element: Hashable {
    var uniques: Array {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}
