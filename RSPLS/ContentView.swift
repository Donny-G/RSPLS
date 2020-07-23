//
//  ContentView.swift
//  RSPLS
//
//  Created by DeNNiO   G on 04.05.2020.
//  Copyright © 2020 Donny G. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var buttonImages = ["rock", "scissors", "paper", "lizard", "spock"]
    @State private var oponentEnemy = Int.random(in: 0...4)
    @State private var result = ""
    @State private var showAlert = false
    @State private var score = 0
    @State private var counter = 0
    @State private var cpu = ""
    
    func tappedButon(number: Int) {
        counter += 1
        if oponentEnemy == 0 && number == 0 {
            result = "Draw: Rock (CPU) - Rock"
            print("rock-rock")
        }else if oponentEnemy == 0 && number == 1 {
            score -= 1
            result = "Loss: Rock (CPU) crushes Scissors"
            print("rock-scissors")
        }else if oponentEnemy == 0 && number == 2 {
            score += 1
            result = "Win: Paper covers Rock (CPU)"
            print("rock-paper")
        }else if oponentEnemy == 0 && number == 3 {
            score -= 1
            result = "Loss: Rock (CPU) crushes Lizard"
            print("rock-lizard")
        }else if oponentEnemy == 0 && number == 4 {
            score += 1
            result = "Win: Spock vaporizes Rock (CPU)"
            print("rock-spock")
            
        }else if oponentEnemy == 1 && number == 0 {
            score += 1
            result = "Loss: Rock crushes Scissors (CPU)"
            print("scissors-rock")
        }else if oponentEnemy == 1 && number == 1 {
            result = "Draw: Scissors - Scissors"
            print("scissors-scissors")
        }else if oponentEnemy == 1 && number == 2 {
            score -= 1
            result = "Loss: Scissors (CPU) cuts Paper"
            print("scissors-paprt")
        }else if oponentEnemy == 1 && number == 3 {
            score -= 1
            result = "Loss: Scissors (CPU) decapitates Lizard"
            print("scissors-lizard")
        }else if oponentEnemy == 1 && number == 4 {
            score += 1
            result = "Win: Spock smashes Scissors (CPU)"
            print("scissors-spock")
            
        }else if oponentEnemy == 2 && number == 0 {
            score -= 1
            result = "Loss: Paper (CPU) covers Rock"
            print("paper-rock")
        }else if oponentEnemy == 2 && number == 1 {
            score += 1
            result = "Win: Scissors cuts Paper (CPU)"
            print("paper-scissors")
        }else if oponentEnemy == 2 && number == 2 {
            result = "Draw: Paper (CPU) - Paper"
            print("paper-paper")
        }else if oponentEnemy == 2 && number == 3 {
            score += 1
            result = "Win: Lizard eats Paper (CPU)"
            print("paper-lizard")
        }else if oponentEnemy == 2 && number == 4 {
            score -= 1
            result = "Loss: Paper (CPU) disproves spock"
            print("paper-spock")
            
        }else if oponentEnemy == 3 && number == 0 {
            score += 1
            result = "Win: Rock crushes Lizard (CPU)"
            print("lizard-rock")
        }else if oponentEnemy == 3 && number == 1 {
            score += 1
            result = "Win: Scissors decapitates Lizard (CPU)"
            print("lizard-scissors")
        }else if oponentEnemy == 3 && number == 2 {
            score -= 1
            result = "Loss: Lizard (CPU) eats Paper"
            print("lizard-paper")
        }else if oponentEnemy == 3 && number == 3 {
            result = "Draw: Lizard (CPU) - Lizard "
            print("lizard-lizard")
        }else if oponentEnemy == 3 && number == 4 {
            score -= 1
            result = "Loss: Lizard (CPU) poisons Spock"
            print("lizard-spock")
            
        }else if oponentEnemy == 4 && number == 0 {
            score -= 1
            result = "Loss: Spock (CPU) vaporizes Rock"
            print("spock-rock")
        }else if oponentEnemy == 4 && number == 1 {
            score -= 1
            result = "Loss: Spock (CPU) smashes Scissors"
            print("spock-scissors")
        }else if oponentEnemy == 4 && number == 2 {
            score += 1
            result = "Win: Paper disproves spock (CPU)"
            print("spock-paper")
        }else if oponentEnemy == 4 && number == 3 {
            score += 1
            result = "Win: Lizard poisons Spock (CPU)"
            print("spock-lizard")
        }else if oponentEnemy == 4 && number == 4 {
            result = "Draw: Spock - Spock"
            print("spock-spock")
        }
        cpu = buttonImages[oponentEnemy].uppercased()
        oponentEnemy = Int.random(in: 0...4)
        
        if counter == 10 && score >= 6 {
            result = "Your score is \(score). You win"
            showAlert = true
        }else if counter == 10 && score == 5 {
            result = "Your score is \(score). Draw"
            showAlert = true
        } else if counter == 10 && score < 5 {
            result = "Your score is \(score). You loose"
            showAlert = true
        }
    }
        
    func newGame() {
        oponentEnemy = Int.random(in: 0...4)
        counter = 0
        score = 0
        cpu = ""
        result = ""
        showAlert = false
    }
 
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black,  .orange, .yellow]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
                VStack {
                    VStack {
                        Text("R-S-P-L-S")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .shadow(color: .yellow, radius: 4)
                            .padding()
                
                            HStack(spacing: 40) {
                                Text("Score is:\(score) ")
                                Text ("CPU: \(cpu)")
                                Text("Counter: \(counter)")
                            }
                                .font(.headline)
                                .foregroundColor(.orange)
                                .shadow(color: .red, radius: 4)
                                .padding()
                        
                                    Text("\(result)")
                                        .font(.headline)
                                        .foregroundColor(.yellow)
                                        .shadow(color: .red, radius: 4)
                    }
                        
                        VStack {
                            ForEach(0..<buttonImages.count){ number in
                                Button(action: {
                                    self.tappedButon(number: number)
                                }) {
                                    Image(self.buttonImages[number])
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                        .shadow(color: .black, radius: 4)
                                    }
                                }
                        }
                    
                Button(action: {
                    self.newGame()
                }) {
                    Image("new game")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 150, height: 75)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.yellow, lineWidth: 3))
                        .shadow(color: .black, radius: 4)
                    }
            }
        }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("GAME IS OVER"), message: Text("\(result)"), dismissButton: .default(Text("NEW GAME")) {
                    self.newGame()
                })
            }
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
}

