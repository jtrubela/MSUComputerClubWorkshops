//
//  ContentView.swift
//  RockPaperScissorGame
//
//  Created by Justin Trubela on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstView = true
    @State private var gameView = false
    
    @State private var name = ""
    private var nerdEmoji = "🤓"
    
    // Game view variables //
    @State private var choices = ["Rock", "Paper", "Scissors"]
    private var getRandomChoice = Int.random(in: 0...2)
    
    let MAXQUESTIONS = 10
    @State private var questionCount = 1
    
    @State private var playerScore = 0
    @State private var playerSelection = ""
    @State private var numberOfDraws = 0
    
    @State private var computerScore = 0
    var computerSelection: String {
        choices[getRandomChoice]
    }
    
    // Game Functions
    func playGame() {
        firstView.toggle()
        gameView.toggle()
    }
    
    func restartGame() {
        questionCount = 1
        playerScore = 0
        computerScore = 0
        numberOfDraws = 0
    }
    
    func askQuestion() {
        if questionCount < MAXQUESTIONS {
            questionCount += 1
            choices.shuffle()
        }
        else{
            gameView = false
            firstView = false
        }
    }
    
    func whoWhins() {
        //Win cases
        if computerSelection == "Rock" && playerSelection == "Paper"
            || computerSelection == "Paper" && playerSelection == "Scissors"
            || computerSelection == "Scissors" && playerSelection == "Rock" {
            
                playerScore += 1
                
        }
        //Draw cases
        else if computerSelection == "Rock" && playerSelection == "Rock"
            || computerSelection == "Paper" && playerSelection == "Paper"
            || computerSelection == "Scissors" && playerSelection == "Scissors" {
                
                numberOfDraws += 1
                
            }
        //Lose cases
        else{
            computerScore += 1
        }
    }
    
    
    
    
    var body: some View {
        
        if firstView {
        //-----------------
        //First View
        //-----------------
            
            ZStack{
                Color.blue.ignoresSafeArea()
                
                VStack{
                    
                    Spacer()
                    
                    Text("Welcome to \nRock Paper Scissors!")
                        .font(.largeTitle.bold())
                    
                    Spacer()
                    
                    
                    TextField("Enter your name", text: $name)
                        .padding(20.0)
                        .frame(width: 375.0, height: 75.0)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: .black, radius: 10, x: 8, y: 2)
                    
                    Spacer()
                    
                    
                    Button("Let's Play",role: .none, action: playGame).AddMyButtonStyle()
                    
                    
                    Spacer()
                }
            }
            
            
        }
        else if gameView {
        //-----------------
        //Game View
        //-----------------
            
            ZStack{
                Color.blue.ignoresSafeArea()
                
                VStack{
                    
                    Spacer()
                    
                    Text("Welcome to \nRock Paper Scissors!")
                        .font(.largeTitle.bold())
                    
                    Spacer()

                    
                    Section{
                        VStack{
                            Image("\(computerSelection)")
                            Text("\(computerSelection)")
                        }.AddMyFirstBackgroundStyle()
                    } header: {
                        Text("Computer Chose")
                    }
                    
                    
                    Spacer()

                    
                    Section{
                        HStack{
                            ForEach(0..<3) { image in
                                Button {
                                    playerSelection = choices[image]
                                    whoWhins()
                                    askQuestion()
                                } label: {
                                    Image("\(choices[image])")
                                        .shadow(color: .black, radius: 10, x: 8, y: 2)
                                }
                            }
                        }.AddMySecondBackgroundStyle()
                    } header: {
                        Text("\(name)'s choices")
                    }
                    
                    Spacer()

                    
                    VStack{
//                        Text("playerSelection:\(playerSelection)")
//                        Text("computerSelection:\(computerSelection)")
                        Text("playerScore:\(playerScore)")
                        Text("computerScore:\(computerScore)")
//                        Text("numberOfDraws:\(numberOfDraws)")
//                        Text("questionCount:\(questionCount)")
                    }.font(.title.bold())
                    
                    Spacer()
                    
                }
            }
            
            
        }
        else{
        //-----------------
        //Final View
        //-----------------
            
            ZStack{
                Color.blue.ignoresSafeArea()
                
                VStack{
                    Spacer()
                    
                    VStack{
                        Text("Game Over")
                        Text("Thanks for playing \n\(name)")
                        Text("\(nerdEmoji)")
                    }
                    .font(.largeTitle.bold()).foregroundColor(.white)
                    .AddMySecondBackgroundStyle()
                    
                    Spacer()
                    
                    VStack{
                        Text("playerScore:\(playerScore)")
                        Text("computerScore:\(computerScore)")
                        Text("numberOfDraws:\(numberOfDraws)")
                        Text("\(playerScore)/\(MAXQUESTIONS)")
                    }.font(.title)
                    
                    Spacer()
                    
                    
                    Button(){
                        
                    } label: {
                        Text("Play Again")
                    }.AddMyButtonStyle()
                    
                    
                    Spacer()
                }
                
                                
            }
            
            
        }

          
            
    }
}


struct MakeMyFirstBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: UIScreen.main.bounds.width-250, maxHeight: 200)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
extension View {
    func AddMyFirstBackgroundStyle() -> some View {
        modifier(MakeMyFirstBackground())
    }
}

struct MakeMySecondBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: UIScreen.main.bounds.width-30, maxHeight: 200)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(.largeTitle)
    }
}
extension View {
    func AddMySecondBackgroundStyle() -> some View {
        modifier(MakeMySecondBackground())
    }
}

struct MakeAButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .tint(.blue)
            .font(.title2.bold())
            .frame(width: 200, height: 65, alignment: .center)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black, radius: 10, x: 8, y: 2)
    }
}
extension View {
    func AddMyButtonStyle() -> some View {
        modifier(MakeAButton())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
