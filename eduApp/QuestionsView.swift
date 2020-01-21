//
//  QuestionsView.swift
//  eduApp
//
//  Created by Moritz Schaub on 20.01.20.
//  Copyright © 2020 Moritz Schaub. All rights reserved.
//

import SwiftUI

struct QuestionsView: View {
    
    @Binding var numberOfQuestions : Int
    @Binding var questions : [Question]
    @Binding var currentQuestion : Int
    @Binding var title : String
    @Binding var score : Int
    @Binding var answers: [Int]
    
    @Binding var questionView : QuestionView
    
    
    @State private var showingSolution = false

    var body: some View {
        VStack {
            self.questionView
            HStack {
                ForEach(0 ..< self.answers.count, id: \.self) { number in
                    Button(action: {
                        if !self.showingSolution{
                            self.evaluateAnswer(number: number)
                        }
                    }, label: {
                        Text("\(self.answers[number])")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(width: 80, height: 50)
                        .background(Color.init(.systemBackground))
                    })
                        .overlay(Color.red.opacity(
                            self.showingSolution && self.answers[number] != self.questions[self.currentQuestion].correctAnswer ? 0.6 : 0
                        ))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .scaleEffect(self.showingSolution && self.answers[number] == self.questions[self.currentQuestion].correctAnswer ? 1.4 : 1)
                        .padding(.horizontal, 5)
                        .animation(.default)
                }
            }
        
        }
    }
    
    func evaluateAnswer(number: Int){
        showingSolution = true
        if self.answers[number] == self.questions[self.currentQuestion].correctAnswer {
            self.score += 1
        } else{
            if self.score > 0{
                self.score += -1
            }
        }
        
        //delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.newQuestion()
        }
    }
    
    func newQuestion() {
        showingSolution = false
        currentQuestion += 1
        self.answers = self.questions[self.currentQuestion].possibleAnswers()
        self.questionView = self.questions[self.currentQuestion].questionView()
        title = "Question \(self.currentQuestion + 1) of \(self.numberOfQuestions)"
    }
    
}
