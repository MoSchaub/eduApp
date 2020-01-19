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
    @State private var title = "Multiplications"
    
    var body: some View {
        NavigationView {
            Group {
                if !active{
                    VStack{
                        
                        BoundarySelector(lowerBoundary: $lowerBoundary, upperBoundary: $upperBoundary)
                        
                        QuestionSelector(numberOfQuestions: $numberOfQuestions, lowerBoundary: $lowerBoundary, upperBoundary: $upperBoundary)
                        
                        
                        Button(action: {
                            self.startGame()
                        }, label: {
                            Text("Start")
                                .frame(width: 150, height: 40)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        })
                        
                        Spacer()
                        
                    }
                    
                    
                } else {
                    if currentQuestion < (numberOfQuestions-1){
                        questions[0].questionView()
                        
                    } else {
                        Text("Score")
                    }
                }
                
            }
            .navigationBarTitle(title)
            .font(.headline)
        }
    }
    func startGame(){
        self.questions = generateQuestions()
        self.active = true
        title = "Question \(self.currentQuestion + 1) of \(self.numberOfQuestions)"
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

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
        }.card()
    }
    
    func numberOfAllQuestions() -> Int{
        (upperBoundary - lowerBoundary + 1) * 10
    }
    
}

struct BoundarySelector: View {
    
    @Binding var lowerBoundary : Int
    @Binding var upperBoundary : Int

    var body: some View {
        VStack {
            Text("Number(s) to practice?")
                .fontWeight(.bold)
                .headline()
                .padding(.top, 20)
            
            VStack {
                HStack {
                    Text("From:")
                        .font(.caption)
                    
                    Stepper(value: $lowerBoundary, in: 1...upperBoundary) {
                        Text("\(lowerBoundary)")
                    }
                    
                }.padding(.horizontal, 20)
                
                HStack {
                    Text("To:")
                        .font(.caption)
                    
                    Stepper(value: $upperBoundary, in: lowerBoundary...12) {
                        Text("\(upperBoundary)")
                    }
                    
                }
                .padding(.horizontal, 20)
                
            }.padding(.horizontal, 40)
        }.card()
    }
}
