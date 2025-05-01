//
//  ItemsCard.swift
//  Quizie
//
//  Created by mohammad ichwan al ghifari on 29/04/25.
//

import SwiftUI

struct ItemsCard: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @Binding var isTabBarHidden: Bool
    @StateObject var viewModel = CategoriesViewModel()
    
    var body: some View {
        ScrollView{

                
                VStack(spacing: 10) {
                    ForEach(viewModel.quizData.indices, id: \.self) { index in
                        let data = viewModel.quizData[index]
                        
                        ZStack {
                            VStack(alignment: .leading) {
                                NavigationLink{
                                    QuizConfirmationView(category: data.category, isTabBarHidden: $isTabBarHidden)
                                        .environmentObject(triviaManager)
                                        .toolbar(.hidden, for: .tabBar)
                                    
                                } label: {
                                    ItemButton(text: data.name)
                                }
                                Spacer()
                                Text(data.description)
                                    .foregroundStyle(Color.white)
                                    .font(Font.custom("Teko", size: 20))
                                    .fontWeight(.regular)
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .frame(height: 120)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(data.Color)
                            
                            
                            Text(data.icon)
                                .font(.system(size: 70))
                                .offset(x: 120, y: -45)
                            
                            Text(data.icon)
                                .font(.system(size: 40))
                                .offset(x: 0, y: 65)
                            
                            Text(data.icon)
                                .font(.system(size: 50))
                                .offset(x: 190, y: 50)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                }
                .padding(.horizontal)
            }
        }

}
#Preview {
    CategoriesView(isTabBarHidden: .constant(false))
        .environmentObject(TriviaManager())
}
