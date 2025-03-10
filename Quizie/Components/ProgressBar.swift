//
//  ProgressBar.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 28/01/25.
//

import SwiftUI

struct ProgressBar: View {
    @EnvironmentObject var triviaManager : TriviaManager
    var progress:CGFloat
    
    var progressColor: Color {
        switch triviaManager.category {
        case "random": return .red
        case "geography": return .yellow
        case "sport": return .green
        default: return .black
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        // Background Bar (Full width)
                        Rectangle()
                            .frame(height: 10)
                            .foregroundStyle(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                        
                        // Progress Bar
                        Rectangle()
                            .frame(width: geometry.size.width * triviaManager.progress, height: 10) // Responsive width
                            .foregroundStyle(progressColor)
                            .cornerRadius(10)
                    }
                }
                .frame(height: 10) // Tetapkan tinggi GeometryReader
    }
}

#Preview {
    ProgressBar(progress:50)
        .environmentObject(TriviaManager())
    
}
