//
//  ContentView.swift
//  eduApp
//
//  Created by Moritz Schaub on 15.01.20.
//  Copyright © 2020 Moritz Schaub. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var active = false
    
    @State private var lowerBoundary = 1
    @State private var upperBoundary = 12
    
    @State private var numberOfQuestions = 5
    @State private var questions = [Question]()
    @State private var currentQuestion = 0
    
    var body: some View {
        NavigationView {
            Group {
                if !active{
                    VStack{
                        
                        BoundarySelector(lowerBoundary: $lowerBoundary, upperBoundary: $upperBoundary)
                        
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
                        }.card()
                        
                        
                        Button("Start Game") {
                            // did tap
                        }
                        
                    }
                    
                    
                } else {
                    Text("Test")
                }
                
            }
            .navigationBarTitle("eduApp")
            .font(.headline)
        }
    }
    func startGame(){
        self.questions = generateQuestions()
    }
    
    func generateQuestions() -> [Question]{
        var arr = [Question]()
        for i1 in lowerBoundary ... upperBoundary  {
            for i2 in 1 ... 10  {
                arr.append(Question(number1: i1, number2: i2))
            }
        }
        arr.shuffle()
        while arr.count != numberOfQuestions {
            arr.removeLast()
        }
        return arr
    }
    
    func numberOfAllQuestions() -> Int{
        (upperBoundary - lowerBoundary + 1) * 10
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
