//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yavuz Kaan Akyüz on 17.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .fontDesign(.rounded)
                        .font(.system(size: 46))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        //flag was tapped
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .cornerRadius(10)
                            .shadow(color: .white.opacity(0.2), radius: 10)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }


        }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

