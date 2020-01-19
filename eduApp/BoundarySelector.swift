//
//  BoundarySelector.swift
//  eduApp
//
//  Created by Moritz Schaub on 19.01.20.
//  Copyright © 2020 Moritz Schaub. All rights reserved.
//

import SwiftUI

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

