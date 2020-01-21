//
//  QuestionView.swift
//  eduApp
//
//  Created by Moritz Schaub on 19.01.20.
//  Copyright © 2020 Moritz Schaub. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    var firstNumber: Int
    var secondNumber: Int
    
    var body: some View {
        HStack {
            Text("\(firstNumber)")
                .font(Font.system(size: 80.0, weight: .black))
                .frame(width: 100)
            Text("x")
                .font(Font.system(size: 70.0, weight: .bold))
                .frame(width: 60)
            Text("\(secondNumber)")
                .font(Font.system(size: 80.0, weight: .black))
                .frame(width: 100)
        }
    }
}

struct EquationView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(firstNumber: 11, secondNumber: 8)
    }
}
