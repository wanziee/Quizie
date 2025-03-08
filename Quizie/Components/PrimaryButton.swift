//
//  PrimaryButton.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 28/01/25.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color.black

    var body: some View {
        Text(text)
            .foregroundStyle(Color.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(50)
            .fontWeight(.heavy)
        
    }
}

struct CardButton: View {
    var text: String
    var background: Color = Color.black

    var body: some View {
        Text(text)
            .foregroundStyle(Color.white)
            .padding(16)
            .padding(.horizontal)
            .background(background)
            .cornerRadius(50)
            .fontWeight(.heavy)
        
    }
}

struct PlayAgainButton: View {
    var text: String


    var body: some View {
        Text(text)
            .font(.custom("Oswald", size: 15))
            .foregroundStyle(Color.white)
            .padding(11)
            .padding(.horizontal)
            .background(Color(red: 234/255, green: 76/255, blue: 55/255))
            .cornerRadius(50)
            .fontWeight(.heavy)
        
    }
}




#Preview {

    PlayAgainButton(text: "Play Again")
}
