//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Xiaochun Shen on 2019/10/25.
//  Copyright © 2019 Shen Xiaochun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    
    var body: some View {
        
        func flagTapped(_ number: Int) {
            if number == correctAnswer {
                scoreTitle = "Correct"
            } else {
                scoreTitle = "Wrong"
            }
            showingScore = true
        }
        
        func askQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
        
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
        VStack {
//            Text("Tap the flag of")
            self.flagTapped(number)
                .foregroundColor(.white)
            Text(countries[correctAnswer])
                .foregroundColor(.white)
       
        
        ForEach(0 ..< 3) { number in
            Button(action: {
                // flag was tapped
            }) {
                Image(self.countries[number])
                    .renderingMode(.original)
            }
            Spacer()
        }
     }
    }
    }
    
    .alert(isPresented: $showingScore) {
    Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dissmissButton: .default(Text("Continue")) {
    self.askQuestion()
    })
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
