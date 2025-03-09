//
//  EnvironmentKeys.swift
//  Quizie
//
//  Created by mohammad ichwan al ghifari on 09/03/25.
//

import SwiftUI

import SwiftUI

private struct IsTabBarHiddenKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}

extension EnvironmentValues {
    var isTabBarHidden: Binding<Bool> {
        get { self[IsTabBarHiddenKey.self] }
        set { self[IsTabBarHiddenKey.self] = newValue }
    }
}
