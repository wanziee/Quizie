//
//  QuestionView.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 28/01/25.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [Color("backgroundColor"),.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            ScrollView{
                VStack(spacing: 40){
                    HStack{
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height:50)
                        
                        Spacer()
                        
                        Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                            .fontWeight(.heavy)
                            .font(Font.custom("Oswald", size: 18))
                    }
                    
                    ProgressBar(progress: triviaManager.progress)
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text(triviaManager.question)
                            .font(Font.custom("Oswald", size: 23))
                            .fontWeight(.heavy)
                        
                        ForEach(triviaManager.answerChoices, id: \.id){ answer in
                            AnswerRow(answer: answer)
                                .environmentObject(triviaManager)
                        }
                    }
                    
                    Button {
                        triviaManager.goToNextQuestion()
                    } label: {
                        PrimaryButton(text: "next", background:triviaManager.answerSelected ? Color.black : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.927))
                    }
                    
                    
                    Spacer()
                }
                .padding()
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    QuestionView()
        .environmentObject(TriviaManager())
}
