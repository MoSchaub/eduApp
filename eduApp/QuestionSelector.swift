//
//  QuestionSelector.swift
//  eduApp
//
//  Created by Moritz Schaub on 20.01.20.
//  Copyright © 2020 Moritz Schaub. All rights reserved.
//

import SwiftUI

struct QuestionSelector: View {
    @Binding var numberOfQuestions : Int
    @Binding var lowerBoundary : Int
    @Binding var upperBoundary : Int
    
    var body: some View {
        VStack {
            Text("How many Questions?")
            
            Picker("",selection: $numberOfQuestions){
                Text("All").tag(self.numberOfAllQuestions())
                Text("5").tag(5)
                Text("10").tag(10)
                if self.numberOfAllQuestions() >= 20{
                    Text("20").tag(20)
                }
            }
            .labelsHidden()
            .pickerStyle(SegmentedPickerStyle())
        }
    }
    
    func numberOfAllQuestions() -> Int{
        (upperBoundary - lowerBoundary + 1) * 10
    }
    
}
