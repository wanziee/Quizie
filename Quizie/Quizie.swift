//
//  belajar_swiftApp.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 26/12/24.
//

import SwiftUI

@main
struct Quizie: App {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted = false
    @StateObject var triviaManager = TriviaManager()
    var body: some Scene {
        WindowGroup {
            if isOnboardingCompleted {
                ContentView()
            } else {
                OnboardingScreen()
            }
        }
        .environmentObject(triviaManager)
    }
}
