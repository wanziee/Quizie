//
//  SearchView.swift
//  Quizie
//
//  Created by mohammad ichwan al ghifari on 27/03/25.
//


import SwiftUI


struct CategoriesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        NavigationStack{
        ZStack {
            if colorScheme == .dark {
                Color("backgroundColor")

                            .ignoresSafeArea()
            } else {
                LinearGradient(
                    gradient: Gradient(colors: [Color("backgroundColor"), .white, .white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            }
            

            ItemsCard( isTabBarHidden: $isTabBarHidden)
                .safeAreaInset(edge: .top, spacing: 0) {
                    Color.clear.frame(height: 10) // Tambahan ruang aman
                }
             
            }
        }
    }
}

#Preview {
    CategoriesView(isTabBarHidden: .constant(false))
        .environmentObject(TriviaManager())
}
        
