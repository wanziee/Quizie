//
//  QuestionView.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 28/01/25.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager
    
    var progressColor: Color {
        switch triviaManager.category {
        case "random": return .red
        case "geography": return .yellow
        case "sport": return .green
        default: return .black
        }
    }
    
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
                        
                        HStack{
                            Text("\(triviaManager.index + 1)")
                                .fontWeight(.heavy)
                                .font(Font.custom("Oswald", size: 23))
                                .foregroundStyle(progressColor)
                            Text("out of \(triviaManager.length)")
                                .fontWeight(.heavy)
                                .font(Font.custom("Oswald", size: 20))
                        }

                    }
                    
                    ProgressBar(progress: triviaManager.progress)
                    
                    
                    if triviaManager.length == 0{
                        VStack {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .scaleEffect(2) // Memperbesar ukuran indikator

                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, 200)
                    } else {
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
