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
    @State private var answers = [Int]()
    @State private var currentQuestion = 0
    @State private var title = "Multiplications"
    @State private var score = 0
    @State private var questionView = QuestionView(firstNumber: 0, secondNumber: 0 )
    
    
    var body: some View {
        NavigationView {
            Group {
                ZStack{
                    Color.init(.secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
                    if !active{
                        SettingsView(active: $active, lowerBoundary: $lowerBoundary, upperBoundary: $upperBoundary, numberOfQuestions: $numberOfQuestions, questions: $questions, answers: $answers, currentQuestion: $currentQuestion, title: $title,questionView: $questionView)
                        
                        
                    } else {
                        VStack{
                            if currentQuestion < (numberOfQuestions-1){
                                
                                QuestionsView(numberOfQuestions: $numberOfQuestions, questions: $questions, currentQuestion: $currentQuestion, title: $title, score: $score,answers: $answers,questionView: $questionView)
                                
                            } else {
                                VStack{
                                    Spacer()
                                    Text("\(score+1)/\(numberOfQuestions)")
                                        .font(Font.system(size: 80.0, weight: .black))
                                        .onAppear {
                                            self.title = "Final score"
                                    }
                                    Spacer()
                                }
                            }
                            Spacer()
                            
                            if currentQuestion < (numberOfQuestions-1){
                                Text("Score: \(self.score)")
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.primary)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                                .background(Color.green)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                                .padding(.horizontal, 40)
                            }
                            
                            Button(action: {
                                self.restart()
                            }) {
                                Text("Back to Settings")
                                    .foregroundColor(.green)
                                .padding()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(title)
            .font(.headline)
        }
    }
    

    func restart() {
        currentQuestion = 0
        title = "Multiplications"
        score = 0
        active = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



