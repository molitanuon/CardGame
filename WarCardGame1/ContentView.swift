//
//  ContentView.swift
//  WarCardGame1
//
//  Created by Molita Nuon on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card5"
    @State var cpuCard = "card9"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        VStack()
        {
            Image("logo")
            Spacer()
            HStack()
            {
                Spacer()
                Image(playerCard)
                Spacer()
                Image(cpuCard)
                Spacer()
            }
            Spacer()
            
            Button(action: {
                
                //Generate a random between 2 to 14
                let playRand = Int.random(in: 2...14)
                let cpuRand = Int.random(in: 2...14)
                //update the cards
                playerCard = "card" + String(playRand)
                cpuCard = "card" + String(cpuRand)
                
                //update the score
                if(playRand > cpuRand || playRand != 14 && cpuRand == 14){
                    playerScore += 1
                }
                else if (playRand < cpuRand || playRand == 14 && cpuRand != 14){
                    cpuScore += 1
                }
                
            }, label: {
                Image("dealbutton")
            })
            
            Spacer()
            HStack
            {
                Spacer()
                VStack()
                {
                    Text("PLAYER")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10.0)
                
                    Text(String(playerScore))
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        
                }
                Spacer()
                VStack()
                {
                   
                    Text("CPU")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10.0)
                    
                    Text(String(cpuScore))
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.947, green: 0.957, blue: 0.944))
            
                }
                Spacer()
            }
            
        }
        .background(Image("background").edgesIgnoringSafeArea(.all))
                        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11")
            
        }
    }
}
