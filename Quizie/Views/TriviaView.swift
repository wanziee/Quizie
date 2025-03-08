//
//  TriviaView.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 28/01/25.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var body: some View {
        
        if triviaManager.reachedEnd{
            NavigationView{
                ZStack{
                    LinearGradient(gradient: .init(colors: [Color("backgroundColor"),.white,.white]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    VStack(spacing:20){
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height:70)
                        
                        Text("Congratulations, you completed the game! 🥳")
                            .font(Font.custom("Oswald", size: 20))
                        
                        Text("You Scored \(triviaManager.score) out of \(triviaManager.length)")
                            .font(Font.custom("Oswald", size: 20))
                        HStack(spacing: 15){
                            Button{
                                Task{
                                    await triviaManager.fetchTrivia()
                                }
                            } label: {
                                PrimaryButton(text: "Play Again")
                            }
                            
                            NavigationLink{
                                HomeScreen()
                            } label: {
                                PrimaryButton(text: "Go Home")
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }else{
            QuestionView()
                .environmentObject(triviaManager)

        }
        
    }
}

#Preview {
    TriviaView()
        .environmentObject(TriviaManager())
}
