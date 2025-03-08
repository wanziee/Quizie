//
//  CustomTabBar.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 26/02/25.
//

import SwiftUI

struct CustomTabBar: View {
    var activeforeground: Color = .white
    var activeBackground: Color = .black
    @Binding var activeTab: TabModel
    @Namespace private var animation
    @State private var tabLocation: CGRect = .zero
    var body: some View {
        HStack(spacing: 0){
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                Button{
                    activeTab = tab
                } label: {
                    HStack(spacing: 5){
                        Image(systemName: tab.rawValue)
                            .font(.title3.bold())
                            .frame(width: 30, height: 30)
                        
                        if activeTab == tab{
                            Text(tab.title)
                                .font(Font.custom("Oswald", size: 14))
                                .fontWeight(.semibold)
                                .lineLimit(1)
                        }
                    }
                    .foregroundStyle(activeTab == tab ? activeforeground : .gray)
                    .padding(.vertical,2)
                    .padding(.leading, 10)
                    .padding(.trailing, 15)
                    .contentShape(.rect)
                    .background{
                        if activeTab == tab {
                            Capsule()
                                .fill(activeBackground)
                                .onGeometryChange(for: CGRect.self, of: {
                                    $0.frame(in: .named(""))
                                }, action: { newValue in
                                    tabLocation = newValue
                                })
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 10)
        .frame(height: 50)
        .background(
            Color.white
                .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
            .shadow(.drop(color: .black.opacity(0.06), radius: 5, x: -5, y: -5)),
            in: .capsule
        )
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
    }
}

#Preview {
    ContentView()
}
