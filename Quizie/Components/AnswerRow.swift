//
//  AnswerRow.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 28/01/25.
//

import SwiftUI

struct AnswerRow: View {
    var answer: Answer
    @State private var isSelected = false
    @EnvironmentObject var triviaManager: TriviaManager
    var green = Color.green
    var red = Color.red
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .font(Font.custom("Oswald", size: 18))
                .fontWeight(.semibold)
            
            if triviaManager.answerSelected {
                Spacer()
                
                if answer.isCorrect {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(Color.green)
                } else if isSelected {
                    Image(systemName: "x.circle.fill")
                        .foregroundStyle(Color.red)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.clear)
        .foregroundStyle(triviaManager.answerSelected ? (isSelected ? Color.black : (answer.isCorrect ? Color.black : Color.gray)) : Color.black)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? (answer.isCorrect ? green : red) : (triviaManager.answerSelected ? (answer.isCorrect ? green : Color.gray) : Color.black), lineWidth: 2)
        )
        .contentShape(Rectangle())
        .onTapGesture {
            if !triviaManager.answerSelected{
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
        }
    }
}

#Preview {

    AnswerRow(answer: Answer(text: "single", isCorrect: true))
        .environmentObject(TriviaManager())
}
