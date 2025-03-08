//
//  ProgressBar.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 28/01/25.
//

import SwiftUI

struct ProgressBar: View {
    var progress:CGFloat
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundStyle(Color(hue: 350, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 4)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProgressBar(progress:50)
}
